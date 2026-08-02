# Production cutover runbook

Taking `mireiazantop.com` from the legacy Rails 3.2 app on **198.211.119.133** to
the Rails 8.1 rewrite on a new droplet, deployed with Kamal.

`main` has never been deployed. The legacy app keeps serving the domain until
the DNS switch in [Phase D](#phase-d--dns-cutover), and its database and files
are never modified, which is what makes [rollback](#rollback) a DNS change
rather than a restore.

**Read [Rehearsal log](#rehearsal-log) before running any of this.** Everything
in Phase A has been executed end to end against real production data and timed;
Phases B–D have not, because the droplet does not exist yet.
[Phase B0](#phase-b0--provisional-domain-rehearsal) is how to fix that before
cutover day rather than on it.

---

## Placeholders

Values that do not exist yet or live outside this repository. Fill them in
before starting; every command below uses the shell variable names in the first
column.

| Variable | What it is | Status |
| --- | --- | --- |
| `NEW_IP` | Public IP of the new droplet | `161.35.86.234` — `zantop-web`, ams3, `s-1vcpu-2gb`, Ubuntu 26.04 LTS x64, created 2026-08-02 |
| `LEGACY_IP` | Legacy app host | `198.211.119.133` |
| `LEGACY_DB` | Database name of the Rails 3.2 app | TODO — confirm on the box |
| `LEGACY_DB_USER` | Its Postgres role | TODO — confirm on the box |
| `LEGACY_UPLOADS_PATH` | CarrierWave upload root on the legacy box | TODO — confirm on the box |
| `DB_PASSWORD` | Postgres password for the new droplet | Generated 2026-08-02, 32 random bytes hex. In Bitwarden as `ZANTOP_DATABASE_PASSWORD`, see [Secrets](#secrets) |
| `SECRET_KEY_BASE` | Rails message verifier key | Generated 2026-08-02 with `bin/rails secret`. In Bitwarden, see [Secrets](#secrets) |
| DNS provider | Registrar / DNS host for `mireiazantop.com` | GoDaddy — `ns43`/`ns44.domaincontrol.com`. Still TODO: **which GoDaddy account**, and who can log into it. Not necessarily the one holding `pausandalio.net` (`ns57`/`ns58`) |
| `REHEARSAL_HOST` | Provisional hostname for [Phase B0](#phase-b0--provisional-domain-rehearsal) | `pausandalio.net` — the apex, not a subdomain; see [B0.1](#b01--the-hostname) for what that costs and what must not be touched |

The legacy Postgres major version is also unknown. It matters only for
[Phase A1](#a1--dump-the-legacy-production-database): dump with the **legacy
box's own** `pg_dump`, never a newer client from elsewhere.

## Secrets

`.kamal/secrets` is committed and only ever reads from the environment, so no
value in this section belongs in the repository. `config/credentials/production.key`
no longer exists — the encrypted credentials were deleted because their key was
unrecoverable, and `SECRET_KEY_BASE` replaces the one thing they held. There is
no key file to seed anywhere.

Repository secrets the deploy workflow reads (Settings → Secrets and variables →
Actions):

| Secret | Value |
| --- | --- |
| `ZANTOP_DEPLOY_HOST` | `$NEW_IP` |
| `SECRET_KEY_BASE` | Output of `bin/rails secret`. Keep it somewhere durable — losing it invalidates every signed cookie and signed ActiveStorage URL. |
| `ZANTOP_DATABASE_PASSWORD` | `$DB_PASSWORD`. Used twice: the app connects with it and the Postgres accessory is created with it. |
| `ZANTOP_DEPLOY_SSH_KEY` | Private half of the deploy key, whole file including the header and trailer lines. |
| `ZANTOP_DEPLOY_KNOWN_HOSTS` | `ssh-keyscan $NEW_IP` output. Pinned, not `accept-new`. |
| `ZANTOP_SMTP_ADDRESS` | SMTP host of the contact form's mailbox. TODO — the account is not provisioned yet, see todo 36. |
| `ZANTOP_SMTP_USER_NAME` | Its login. |
| `ZANTOP_SMTP_PASSWORD` | Its password. |

The three `ZANTOP_SMTP_*` secrets do not block the deploy: nothing reads them
until a visitor submits the contact form, and `config/environments/production.rb`
resolves them to `nil` rather than raising when they are unset — deliberately, so
`assets:precompile` can run during the image build without them. The cost of
deploying before they exist is that the first contact submission raises, since
`raise_delivery_errors` is on. `ZANTOP_SMTP_PORT` and `ZANTOP_SMTP_DOMAIN` are
non-secret literals already in `config/deploy.yml`.

`KAMAL_REGISTRY_PASSWORD` is not a repository secret: the workflow passes the
automatic `GITHUB_TOKEN`. Running Kamal from a laptop needs a token with
`write:packages` exported under that name instead — and the `gh` CLI's own token
will do, once the scope is added:

```sh
gh auth refresh -h github.com -s write:packages   # once; opens a browser
```

Done on 2026-08-02 for user `pauc`; `docker login ghcr.io -u pauc` confirms it.

**It is deliberately not stored in Bitwarden.** `gh` already holds it in the
system keyring and may rotate it, and a stale copy in the vault would surface as
a 403 on push that reads like a permissions problem rather than an expired
token. Read it live instead. The vault item has an empty
`KAMAL_REGISTRY_PASSWORD` field left over from before that decision; the `jq`
filter below skips it, so it is inert — delete it if it bothers you.

Export the set locally for the Phase B commands, which run from the laptop. The
generated secrets live in Bitwarden, in a secure note named **`zantop deploy`**
(`d8ba53e0-122e-4f6e-b295-b49a00b2de6d`), one custom field per variable:

```sh
export BW_SESSION=$(bw unlock --raw)
eval "$(bw get item 'zantop deploy' | jq -r '.fields[]|select(.value!="")|"export \(.name)=\(.value|@sh)"')"

export KAMAL_REGISTRY_PASSWORD=$(gh auth token)   # live, never stored
export ZANTOP_DEPLOY_HOST=$NEW_IP                 # not secret, not in the vault
```

`select(.value!="")` skips fields that are blank, so a genuinely unfilled one
fails loudly at the point it is needed instead of being exported as an empty
string and surfacing as an unrelated authentication error.

`POSTGRES_PASSWORD` is deliberately **not** a field: `.kamal/secrets` derives it
from `ZANTOP_DATABASE_PASSWORD`, which is what keeps the app and the accessory
from drifting apart. Nothing else should set it.

### Why not the Bitwarden adapter in `.kamal/secrets`

Kamal ships one (`kamal secrets fetch --adapter bitwarden`), and it would work
from a laptop. It is not used here because Kamal parses `.kamal/secrets` with
`Dotenv.parse` plus an inline command-substitution patch — it is a dotenv file,
not a shell script, so it takes `KEY=$(...)` but has no conditionals. There is no
way to express "vault locally, repository secrets in CI" inside it, and
`.github/workflows/deploy.yml` runs `kamal deploy` on a runner that has no `bw`
installed and could not answer the interactive `bw unlock` prompt if it did.
Populating the environment from the vault leaves the committed file working
unchanged for both.

`bitwarden_secrets_manager` (`BWS_ACCESS_TOKEN`) is the non-interactive adapter
that *would* survive CI, but it is a separate Bitwarden product and `bws` is not
installed.

## Pre-flight gates

The cutover is gated on work outside this runbook. Check before starting:

- **Todo 36** — SMTP account for the contact form. The only one still open.
  `config/environments/production.rb` has its `action_mailer.smtp_settings`, but
  the mailbox itself does not exist and the three `ZANTOP_SMTP_*` secrets above
  are unset, so the contact form will not deliver. Not fatal to the cutover — the
  settings resolve to `nil` rather than raising, so the deploy succeeds — but
  `raise_delivery_errors` is on, so the first submission raises. It ships a dead
  form. Check one thing against whichever provider is picked: `ApplicationMailer`
  sends `From: no-reply@mireiazantop.com` while the account will most likely
  authenticate as `hola@`, and providers that require the envelope sender to match
  the authenticated identity will reject that.

Every other gate has closed. For anyone reading an older note, these were listed
as blockers here and are now merged to `main`:

- **Todo 12** — authorization on every admin action, `4ccbd62`. The concern is
  inverted from the legacy version: including it closes every action, and only
  what `allow_anonymous` names is reopened, so an action added later is protected
  by default.
- **Todo 14** — the missing controllers, `6674f47`. `UsersController` exists;
  `AdminController` was never needed, because `admin#section_fields` turned out to
  be dead and was deleted.
- **Todo 39** — unpublished works served to the public, `7ab875e`. Not on this
  list originally but a genuine go-live blocker: 7 of 71 works were reachable by
  slug to anyone.
- Todos 13, 15, 18, 20 and 21, closed earlier.

Also confirm before Phase A:

- `bin/rspec` and `bundle exec rubocop` are clean on `main`.
- The DNS TTL for `mireiazantop.com` has been lowered (see [Phase D](#phase-d--dns-cutover))
  at least one old-TTL period in advance.

---

## Shape of the migration

The data migration runs **on the laptop, not on the droplet**, and the droplet
receives a finished database dump and a finished `uploads/` tree. Reasons:

- `rake migrate_images` is the expensive step — 400 images through libvips and
  ImageOptim, [167 s measured](#rehearsal-log) on a development machine. The
  droplet is small enough that the Docker image is deliberately built in CI
  rather than on it; this workload is the same shape.
- `legacy_uploads/` is excluded from the image (`.dockerignore`, 112 MB), so
  running the task on the droplet means uploading the originals **and**
  bind-mounting them into a hand-rolled `docker run`. Migrating locally uploads
  35 MB of optimised output instead of 112 MB of originals.
- Both halves have been rehearsed this way.

[Appendix B](#appendix-b--running-migrate_images-on-the-droplet) documents the
on-droplet variant with the bind mount, for when it has to happen there.

The ordering constraint that shapes Phase B: `bin/docker-entrypoint` runs
`db:prepare` before Puma binds, and `db:prepare` **creates and loads the schema
when the database does not exist**. If the app container boots first it leaves
an empty `zantop_production` at schema HEAD, and there is then nowhere clean to
restore the dump. So the Postgres accessory is booted and loaded *before* the
first `kamal deploy`, which is why Phase B decomposes `kamal setup` into its
parts instead of running it whole.

---

## Phase A — build the migrated database and uploads locally

Runs entirely on the laptop against a throwaway database. Nothing here touches
either droplet except the read-only dump in A1.

Measured total: **under four minutes**, dominated by A5.

### A1 — dump the legacy production database

From the legacy box, using its own `pg_dump` so the dump matches its server
version:

```sh
ssh root@$LEGACY_IP \
  "pg_dump -U $LEGACY_DB_USER --no-owner --no-acl -Fc $LEGACY_DB" \
  > ~/zantop-legacy-$(date +%Y%m%d).dump
```

Keep this file. It is both the input to Phase A and the artifact the
[rollback](#rollback) leans on if the legacy database is ever touched by
accident.

### A2 — restore it into a scratch database

The local Postgres from `docker-compose.yml` (Postgres 18.4 on host port 5445,
user/password `zantop`) is the target. `zantop_cutover` is a scratch name; it is
dropped in A8.

```sh
docker compose up -d
docker exec -e PGPASSWORD=zantop zantop_db createdb -U zantop zantop_cutover_development
docker cp ~/zantop-legacy-YYYYMMDD.dump zantop_db:/tmp/legacy.dump
docker exec -e PGPASSWORD=zantop zantop_db \
  pg_restore -U zantop -d zantop_cutover_development --no-owner --no-acl /tmp/legacy.dump
```

Everything from here to A7 needs `ZANTOP_DATABASE_NAME` pointed at that scratch
database, so that the worktree's own development database is never at risk:

```sh
export ZANTOP_DATABASE_NAME=zantop_cutover
```

### A3 — pre-flight checks against the restored legacy data

The four earliest migrations rewrite the legacy tables in place and are **not
reversible** (see [Rehearsal log](#rehearsal-log)). Confirm the columns they
expect actually exist before running them:

```sh
docker exec -e PGPASSWORD=zantop zantop_db psql -U zantop -d zantop_cutover_development -c "
select table_name, column_name from information_schema.columns
where (table_name, column_name) in (
  ('taggings','taggable_id'), ('taggings','taggable_type'),
  ('sections','content_id'),  ('sections','content_type'),
  ('images','illustrated_id'),('images','illustrated_type'), ('images','image'),
  ('works','slug_ca'),        ('works','slug_es'), ('works','slug_en'))
order by 1, 2;"
```

All ten rows must come back. `works.slug_ca/es/en` are legacy columns — no
migration in `db/migrate` creates them, so if they are missing the whole slug
story needs rethinking before going further.

Confirm every image has a file waiting for it, since `rake migrate_images` reads
from `legacy_uploads/work_<work_id>/img_<image_id>/<deprecated_image>`:

```sh
docker exec -e PGPASSWORD=zantop zantop_db psql -U zantop -d zantop_cutover_development -Atc \
  "select work_id, id, image from images where image is not null order by id" |
while IFS='|' read -r work id file; do
  [ -f "legacy_uploads/work_$work/img_$id/$file" ] || echo "MISSING legacy_uploads/work_$work/img_$id/$file"
done
```

Silence means the committed `legacy_uploads/` covers the production database.
Any output means the tree is stale relative to production and the missing files
have to be fetched from `$LEGACY_UPLOADS_PATH` on the legacy box and dropped into
the same layout before A5.

### A4 — schema migrations and translations

```sh
bin/rails db:migrate
bin/rails migrate_translations
```

`db:migrate` runs the whole chain, including the three ActiveStorage catch-ups
(`20260801140013`, `20260801140014`, `20260801140015`). All three are no-ops on
this database — `20220702222104_create_active_storage_tables` already creates
`service_name` and `active_storage_variant_records`, and leaves `checksum`
nullable — so they self-skip. They still have to run, to record the versions.

`migrate_translations` converts every `*_translations` table (Globalize) into
`action_text_rich_texts` rows keyed by locale (Mobility's ActionText backend).
It is idempotent: re-running logs `Translation for X already exists` and creates
nothing. The `*_translations` tables are left in place; nothing drops them.

Reconcile the result — these two numbers must be equal:

```sh
docker exec -e PGPASSWORD=zantop zantop_db psql -U zantop -d zantop_cutover_development -c "
select 'expected' as side, sum(n) from (
  select count(*) filter (where title       is not null and title       <> '')
       + count(*) filter (where description is not null and description <> '')
       + count(*) filter (where techniques  is not null and techniques  <> '')
       + count(*) filter (where place       is not null and place       <> '') as n from work_translations
  union all select count(*) filter (where title is not null and title <> '')
       + count(*) filter (where body  is not null and body  <> '') from section_translations
  union all select count(*) filter (where title is not null and title <> '')
       + count(*) filter (where body  is not null and body  <> '') from page_translations
  union all select count(*) filter (where name    is not null and name    <> '') from tag_translations
  union all select count(*) filter (where credits is not null and credits <> '') from image_translations
) t
union all select 'actual', count(*) from action_text_rich_texts;"
```

### A5 — images

This is the long step. `ZANTOP_STORAGE_ROOT` decides where ActiveStorage writes;
point it at a staging directory that will be rsynced to the droplet in B5.

```sh
export ZANTOP_STORAGE_ROOT=$HOME/zantop-cutover-uploads
mkdir -p "$ZANTOP_STORAGE_ROOT"
time bin/rails migrate_images
```

Each image is resized to fit 1200×1200 and run through ImageOptim
(`app/lib/image_optimizer.rb`) before being attached, so the output is
substantially smaller than the input — 112 MB became 35 MB in rehearsal.

Verify. Every `images` row with a `deprecated_image` must have exactly one
attachment, and the only rows left without one are the video embeds:

```sh
docker exec -e PGPASSWORD=zantop zantop_db psql -U zantop -d zantop_cutover_development -c "
select 'attachments', count(*) from active_storage_attachments where record_type='Image' and name='image'
union all select 'images_with_files', count(*) from images where deprecated_image is not null
union all select 'blobs_without_service', count(*) from active_storage_blobs where service_name is null
union all select 'unattached_non_video', count(*) from images i
  left join active_storage_attachments a
    on a.record_type='Image' and a.record_id=i.id and a.name='image'
  where a.id is null and i.video is null;"
find "$ZANTOP_STORAGE_ROOT" -type f | wc -l
```

`attachments` must equal `images_with_files`, and both
`blobs_without_service` and `unattached_non_video` must be zero.

### A6 — do not generate variants locally

Stop here. Do not browse the migrated site locally before taking the dump in A7:
rendering a page processes ActiveStorage variants, which writes
`active_storage_variant_records` rows. A variant row without its file is worse
than no row — Rails treats the row as proof the variant exists and redirects to
a URL that 404s instead of regenerating it. That is the whole reason
`lib/database_dump.rb` strips them out of `db/dump.sql`.

If you have already browsed, either ship the variant files along with the
originals in B5 (they are in the same `$ZANTOP_STORAGE_ROOT` tree, so an rsync
of the whole directory is consistent), or clear the rows:

```sh
docker exec -e PGPASSWORD=zantop zantop_db psql -U zantop -d zantop_cutover_development -c "
delete from active_storage_attachments where record_type = 'ActiveStorage::VariantRecord';
delete from active_storage_variant_records;"
```

### A7 — dump the migrated database

```sh
docker exec -e PGPASSWORD=zantop zantop_db pg_dump -U zantop -Fc --no-owner --no-acl \
  --exclude-table-data=ar_internal_metadata zantop_cutover_development \
  > ~/zantop-cutover.dump
```

Dumped from inside the container because the host client is Postgres 17 and the
server is 18 — the same reason `lib/database_dump.rb` shells into the container.

`ar_internal_metadata` data is excluded for tidiness, matching `DatabaseDump`.
It is not load-bearing: carrying a stale `environment=development` row across
was tested and Rails 8.1 simply overwrites it with `production` on the first
migration. Schema and `schema_migrations` **are** included, unlike `db/dump.sql`,
because the droplet's database starts empty.

### A8 — clean up

After Phase B has consumed the dump:

```sh
docker exec -e PGPASSWORD=zantop zantop_db dropdb -U zantop zantop_cutover_development
unset ZANTOP_DATABASE_NAME ZANTOP_STORAGE_ROOT
```

> `lib/tasks/db.rake` enhances `db:migrate` and `db:rollback` to regenerate
> `db/dump.sql` from whatever database is connected — but only when
> `Rails.env.development?`. A4 runs in development, so it **will** rewrite
> `db/dump.sql` from the scratch database. Restore it afterwards:
> `git checkout db/dump.sql`. On the droplet the hook is inert, since everything
> there runs with `RAILS_ENV=production`.

---

## Phase B0 — provisional-domain rehearsal

**Optional, and worth it.** Phases B–D have never been run against a host. This
runs all three under a hostname that is not the live one, so that the only thing
left untested on cutover day is the DNS change itself.

Deploy it **on the droplet that will become production**. Then the real cutover
is Phase D plus a redeploy, on a box already proven, rather than a first
provisioning under time pressure. The cost is that the rehearsal's data must be
thrown away before going live — see [B0.4](#b04--reset-before-the-real-cutover).

Nothing about the application blocks this any more. The admin area is closed to
anonymous visitors (todo 12) and drafts are no longer served publicly (todo 39),
which is what made an exposed test deployment unacceptable before.

### B0.1 — the hostname

**`pausandalio.net`** — the apex — of a domain we already own and whose zone is
at GoDaddy (`ns57`/`ns58.domaincontrol.com`).

> **Superseded, 2026-08-02.** This section originally specified the subdomain
> `zantop.pausandalio.net`, on the grounds that the apex was not idle. Pau chose
> the apex instead. The paragraph below is kept because the constraint it
> describes is real and still governs what may be touched.

`pausandalio.net` is not idle: it serves a GitHub Pages site (`pauc.github.io`,
at `185.199.108–111.153`). But the split is finer than it first looks — the
**apex 301-redirects to `www`**, which is the custom domain GitHub Pages is
actually configured for. So repointing the apex costs only that redirect: the
site itself stays live at `www.pausandalio.net`, provided the `www` CNAME is
left alone.

Two consequences, both easy to get wrong:

- **Delete the apex `AAAA` records.** They point at GitHub's IPv6 addresses and
  the droplet has none. Let's Encrypt prefers IPv6 where it exists, so leaving
  them means the ACME challenge is served by GitHub Pages and fails validation —
  a failure whose cause is invisible from the error.
- **`ZANTOP_PROXY_HOSTS` gets the apex only, never `www`.** `www` still resolves
  to GitHub. Naming it in `proxy.hosts` is a guaranteed failed validation on a
  loop, which is exactly the hourly limit this rehearsal exists to avoid
  spending.

**Rollback.** The apex records as they stood before the change, to restore when
the rehearsal ends:

```
A     @   185.199.108.153   185.199.109.153   185.199.110.153   185.199.111.153
AAAA  @   2606:50c0:8000::153   2606:50c0:8001::153
          2606:50c0:8002::153   2606:50c0:8003::153
```

The zone is editable through GoDaddy's API. `GODADDY_ACCESS_TOKEN` is a **bearer**
token, not the `sso-key KEY:SECRET` pair the GoDaddy docs lead with — `sso-key`
returns 401 here. `PUT` replaces every record of that type and name at once, so
the array below is the whole record set, not an addition:

```sh
GD="https://api.godaddy.com/v1/domains/pausandalio.net/records"
AUTH="Authorization: Bearer $GODADDY_ACCESS_TOKEN"

curl -sS -X PUT "$GD/A/%40" -H "$AUTH" -H 'Content-Type: application/json' -d '[
  {"data":"185.199.108.153","ttl":600},{"data":"185.199.109.153","ttl":600},
  {"data":"185.199.110.153","ttl":600},{"data":"185.199.111.153","ttl":600}]'

curl -sS -X PUT "$GD/AAAA/%40" -H "$AUTH" -H 'Content-Type: application/json' -d '[
  {"data":"2606:50c0:8000::153","ttl":600},{"data":"2606:50c0:8001::153","ttl":600},
  {"data":"2606:50c0:8002::153","ttl":600},{"data":"2606:50c0:8003::153","ttl":600}]'
```

`%40` is the URL-encoded `@`. A `GET "$GD"` with the same header dumps the whole
zone, which is the cheapest way to confirm a change landed without waiting on
resolver caches — or query `@ns57.domaincontrol.com` directly.

`www` (CNAME → `pauc.github.io`) and the `MX` records
(`smtp`/`mailstore1.secureserver.net`) are **not** touched by any of this, so
mail and the published site are unaffected.

A domain other than `mireiazantop.com` is the better choice, for a reason worth
stating plainly: **Let's Encrypt's certificate limit is per registered domain**,
so a rehearsal under `pausandalio.net` cannot spend `mireiazantop.com`'s weekly
budget however many times it is looped. It also means B0 can start now — the
unanswered "who holds the zone for `mireiazantop.com`"
[placeholder](#placeholders) no longer blocks it, though it still blocks
[Phase D](#phase-d--dns-cutover).

There is no CAA record on `pausandalio.net`, so nothing restricts which authority
may issue for it. Worth having checked: a CAA record naming some other CA fails
an ACME challenge in a way that reads like a configuration bug.

What this hostname does *not* rehearse is the real zone and registrar, so the DNS
edit in Phase D stays first-time-on-the-day. That is the one step of the cutover
that is a single form field, and an acceptable thing to leave unpractised.

**Not `nip.io` or `sslip.io`**, tempting as they are for a name that needs no
zone edit at all: their certificate rate limit is shared across everyone using
them and is routinely exhausted, so issuance fails for reasons that have nothing
to do with this setup — the exact failure this rehearsal exists to rule out.

### B0.2 — run Phases A, B and C against it

Phase A unchanged, except that the source can be `db/dump.sql` and the committed
`legacy_uploads/` instead of a fresh legacy dump — that is what the [rehearsal
log](#rehearsal-log) already used, it is real content, and it means the rehearsal
never touches the legacy box at all.

Then B1–B5 and Phase C as written, with two variables set:

```sh
export ZANTOP_PROXY_HOSTS=$REHEARSAL_HOST   # replaces the real hosts, never adds to them
export ZANTOP_NOINDEX=true
```

`ZANTOP_PROXY_HOSTS` **replaces** the list in `config/deploy.yml`. Leaving
`mireiazantop.com` in it while it still resolves to the legacy box means
kamal-proxy failing an ACME challenge for it on a loop, which is the fastest way
to spend the hourly failed-validation limit.

**Run the rehearsal from the laptop, not the Deploy workflow.** Until 2026-08-02
the workflow's `env:` block did not pass either variable, so a dispatched run
would silently have deployed under the real hosts — the precise failure this
section is written to avoid. It now forwards both as repository *variables*
(Settings → Secrets and variables → Actions → Variables):

| Variable | Rehearsal | Real cutover |
| --- | --- | --- |
| `ZANTOP_PROXY_HOSTS` | `pausandalio.net` | leave undefined |
| `ZANTOP_NOINDEX` | `true` | leave undefined |

Undefined is safe: an unset GitHub variable expands to an empty string, and
`config/deploy.yml` treats blank as unset and falls back to the real hosts.
Setting them to blank is equally safe; **deleting the guard is not**, since an
empty `proxy.hosts` makes kamal-proxy request no certificate and serve plain
HTTP without erroring.

The workflow still cannot run Phase B end to end regardless — it only builds,
pushes and deploys. `kamal server bootstrap`, the accessory boot and the data
load are laptop steps.

`ZANTOP_NOINDEX=true` makes every response carry `X-Robots-Tag: noindex,
nofollow`. Without it the rehearsal puts the entire portfolio on a publicly
resolving hostname for search engines to index as a duplicate of the real site,
and that outlives the rehearsal. It is a header rather than a `Disallow: /` in
`robots.txt` on purpose: disallowing the fetch stops a crawler reading the page
and so stops it seeing that the page asks not to be indexed, which leaves the URL
indexable from any link pointing at it.

Point an A record for `$REHEARSAL_HOST` at `$NEW_IP` **before** the first deploy
here — unlike the real cutover there is no reason to withhold it, and having it
resolve from the start means the certificate is issued on the first boot and
Phase C's `curl` checks work without `--resolve` or `-k`.

Set `SECRET_KEY_BASE` to the value the real site will use, not a throwaway.
Changing it later invalidates every signed cookie and signed ActiveStorage URL.

### B0.3 — what to actually check

Everything Phase A cannot prove:

- The certificate is issued and `https://$REHEARSAL_HOST/ca` answers 200.
- `http://` redirects to `https://` — kamal-proxy's job, not Rails', because of
  `config.assume_ssl`.
- Images render. This is the one that exercises the volume mount, the `1000:1000`
  ownership from [B5](#b5--create-the-uploads-volume-and-copy-the-files) and
  libvips variant processing on a box far smaller than the laptop that timed
  them.
- A second `kamal deploy` is clean, and the previous release's assets stay
  reachable through `asset_path`.
- Sign in, edit a work, upload an image, and confirm it survives a deploy — the
  single most important thing the volume exists for.
- `X-Robots-Tag` is present: `curl -sSI https://$REHEARSAL_HOST/ca | grep -i robots`.

### B0.4 — reset before the real cutover

The rehearsal's database and uploads are throwaway. Anything entered during it —
and anything Mireia enters if she is shown the site — is lost. Before Phase D:

1. Re-run Phase A against a **fresh** legacy dump.
2. Drop and recreate `zantop_production`, then restore, as in [B4](#b4--create-and-load-the-database).
3. `rsync --delete` the uploads again, as in [B5](#b5--create-the-uploads-volume-and-copy-the-files).
4. Unset `ZANTOP_PROXY_HOSTS` and `ZANTOP_NOINDEX`, and redeploy so the real
   hosts and an indexable site come back.
5. Remove the `$REHEARSAL_HOST` A record once it is no longer wanted.

Step 4 is the one that is easy to forget and expensive to miss: a production
deploy still carrying `ZANTOP_NOINDEX=true` serves the live site with a header
telling every search engine to drop it.

---

## Phase B — provision the droplet and load it

Run from the laptop with the environment from [Secrets](#secrets) exported.
`kamal setup` is deliberately **not** used: it boots the accessories and deploys
the app in one command, and the database has to be loaded in between.

### B1 — create the droplet

Ubuntu LTS, x86_64. The image is `amd64` and `Gemfile.lock` records only the
`x86_64-linux` platform, so an ARM droplet fails at `bundle install`.

Add the deploy key to `root`'s `authorized_keys` (`config/deploy.yml` leaves
`ssh.user` at Kamal's default of `root`), then:

```sh
ssh-keyscan $NEW_IP            # → the ZANTOP_DEPLOY_KNOWN_HOSTS secret
ssh root@$NEW_IP true          # confirm key auth works
```

**Ports 80 and 443 must be reachable from the public internet**, and not only so
visitors can read the site: kamal-proxy gets its certificate over an ACME
challenge served on those ports, so a blocked one fails the challenge rather than
producing an obvious connection error. A plain DigitalOcean droplet has no cloud
firewall and ships `ufw` inactive, so this usually needs nothing — but confirm it
rather than discover it in [Phase D](#phase-d--dns-cutover), and check the cloud
firewall in the provider's console too, which `ufw` knows nothing about:

```sh
ssh root@$NEW_IP 'ufw status; iptables -S INPUT'
```

### B2 — install Docker

```sh
bundle exec kamal server bootstrap
```

### B3 — boot Postgres alone

```sh
bundle exec kamal accessory boot db
bundle exec kamal accessory details db
```

The accessory is bound to `127.0.0.1:5432` on the host, so it is reachable only
over SSH. The app reaches it as `zantop-db` on the Kamal Docker network, which
is what `ZANTOP_DATABASE_HOST` is set to in `config/deploy.yml`.

### B4 — create and load the database

The accessory sets `POSTGRES_USER` but **no** `POSTGRES_DB`, so the Postgres
image creates a database named after the user — `zantop`, not
`zantop_production`. Create the real one before restoring:

```sh
scp ~/zantop-cutover.dump root@$NEW_IP:/tmp/zantop-cutover.dump
ssh root@$NEW_IP '
  docker exec zantop-db createdb -U zantop zantop_production &&
  docker cp /tmp/zantop-cutover.dump zantop-db:/tmp/ &&
  docker exec zantop-db pg_restore -U zantop -d zantop_production \
    --no-owner --no-acl /tmp/zantop-cutover.dump &&
  rm /tmp/zantop-cutover.dump'
```

`docker exec` needs no password: the accessory container trusts local
connections. Confirm the restore:

```sh
ssh root@$NEW_IP "docker exec zantop-db psql -U zantop -d zantop_production -c \"
  select 'works', count(*) from works
  union all select 'images', count(*) from images
  union all select 'blobs', count(*) from active_storage_blobs
  union all select 'rich_texts', count(*) from action_text_rich_texts
  union all select 'schema_migrations', count(*) from schema_migrations;\""
```

`schema_migrations` must hold one row per file in `db/migrate` — **14** at the
time of writing, not the 12 this step claimed until 2026-08-02. Count the
directory rather than trusting the number here, since it moves with every
migration: `ls db/migrate/*.rb | wc -l`. Fewer rows than files means
`db:prepare` will try to migrate on first boot, inside the 60 s
`deploy_timeout`.

#### B4 on the rehearsal path — `db/dump.sql` is data-only

[B0.2](#b02--run-phases-a-b-and-c-against-it) allows the committed
`db/dump.sql` as the source instead of a fresh legacy dump. It is **not** the
same kind of artifact and the procedure above does not apply to it:

- It is **plain SQL**, so it loads with `psql`, not `pg_restore`.
- It is **data-only** — 17 `COPY` statements, no `CREATE TABLE`, and no
  `schema_migrations`: `DatabaseDump` (`lib/database_dump.rb`) runs
  `pg_dump -a` with `--exclude-table-data` for `schema_migrations` and
  `ar_internal_metadata`, on the assumption that the structure comes from
  `db/schema.rb`. `db:schema:load` stamps `schema_migrations` itself, from the
  schema's own `version:`, so the count check above still holds on this path.
- It also **omits every ActiveStorage variant record**, deliberately: variants
  are derived, their files are never shipped, and a variant row without its file
  makes Rails redirect to a URL that 404s instead of regenerating it. Variants
  rebuild themselves on first request.

**On this path B4 is not a manual step at all — skip it and deploy.** The
structure comes from `db/schema.rb` and the data from `db/dump.sql`, and
`bin/docker-entrypoint` already does both in that order:

1. The accessory creates a database named after `POSTGRES_USER` — `zantop`, not
   `zantop_production`. So `zantop_production` does not exist on first boot.
2. `db:prepare` therefore takes its create branch: create, `db:schema:load`,
   `db:seed`.
3. `db/seeds.rb` restores `db/dump.sql` through `psql` and raises if it fails.

Everything that needs is in place: `postgresql-client` is installed in the
runtime layer (`Dockerfile:33`), `db/dump.sql` is not in `.dockerignore` so
`COPY . .` ships it, and the dump carries 17 `setval` calls, so sequences are
reset and later inserts cannot collide with restored ids.

> **Do not pre-create `zantop_production`.** An earlier revision of this section
> told you to `createdb` first. That is worse than unnecessary: `db:prepare`
> would then take its *exists* branch, run migrations instead of loading the
> schema, and **never seed** — leaving a structurally correct but empty site,
> with nothing failing to say so.

`db:setup` is the same three steps run unconditionally. Do not use it for the
first deploy — `db:prepare` already covers that — but it is the right tool for
[B0.4](#b04--reset-before-the-real-cutover), since `schema:load` is
`force: :cascade` and so drops and recreates every table.

Two things to know before running it:

- **`db/seeds.rb` also creates `example@example.com` with the password
  `secret`.** On the rehearsal that is a real, working login on a hostname that
  resolves publicly. It is not an admin (`users.admin` defaults to `false`), so
  it cannot reach the admin area, but delete it once the deploy is verified.
- All of this runs inside `deploy_timeout: 60`, before Puma binds. A
  `schema:load` plus a 433 KB restore on one vCPU should be seconds, but it is
  untested on this box — if the first deploy times out, this is the first place
  to look, not the image pull.

Phase D's real cutover is the opposite case: restore the legacy dump into
`zantop_production` **before** the first container starts, exactly as the
entrypoint's own comment says, so `db:prepare` finds an existing database,
merely migrates, and never seeds an `example@example.com` into production.

### B5 — create the uploads volume and copy the files

`config/deploy.yml` mounts `/var/lib/zantop/uploads` at `/data/uploads`, and
`ZANTOP_STORAGE_ROOT=/data/uploads` points ActiveStorage at it. Docker creates
a missing host directory as `root:root`, but the container runs as uid 1000
(`Dockerfile`: `USER 1000:1000`), so it must be chowned or every write fails
with `EACCES`:

```sh
ssh root@$NEW_IP 'mkdir -p /var/lib/zantop/uploads'
rsync -avz --delete "$ZANTOP_STORAGE_ROOT"/ root@$NEW_IP:/var/lib/zantop/uploads/
ssh root@$NEW_IP 'chown -R 1000:1000 /var/lib/zantop/uploads &&
                  find /var/lib/zantop/uploads -type f | wc -l'
```

The file count must match A5.

---

## Phase C — first deploy

Set the five repository secrets from [Secrets](#secrets) first, then run the
**Deploy** workflow (Actions → Deploy → Run workflow) with `command: deploy`.

Not `setup`: B2 and B3 have already done its bootstrap and accessory work, and
re-running it against a loaded database buys nothing. The image is built and
pushed by the runner and only pulled on the droplet — the box has nowhere near
the memory for an esbuild + sass build.

`kamal deploy` boots kamal-proxy if it is not running. Confirm rather than
assume, and fall back to `kamal proxy boot`:

```sh
bundle exec kamal proxy details
bundle exec kamal app logs --lines 100
```

On this first boot `bin/docker-entrypoint` runs `db:prepare`. With B4 done
correctly it finds no pending migrations and returns in well under a second, and
Puma binds immediately.

Verify before touching DNS. `config.assume_ssl = true` means Rails does not
issue the http→https redirect itself and `/up` answers 200 over plain HTTP,
which is exactly what kamal-proxy's health check relies on:

```sh
ssh root@$NEW_IP 'curl -sS -o /dev/null -w "%{http_code}\n" -H "Host: mireiazantop.com" http://127.0.0.1/up'
```

Then a real page and an image, still bypassing DNS:

```sh
curl -sS -o /dev/null -w "%{http_code} %{url_effective}\n" \
  --resolve mireiazantop.com:443:$NEW_IP https://mireiazantop.com/ca
```

**This will fail on certificate validation until Phase D**, because kamal-proxy
gets its Let's Encrypt certificate over an ACME challenge that needs
`mireiazantop.com` to publicly resolve to `$NEW_IP`. That ordering is
unavoidable. To check the application itself before the switch, use `-k` and read
the response body, or go in through the container:

```sh
bundle exec kamal app exec --reuse "bin/rails runner '
  puts Work.count
  puts Work.published.first&.title
  img = Image.joins(:image_attachment).order(:id).first
  puts img.image.variant(:thumb).processed.key'"
```

That last line is the real end-to-end check: it proves the blob rows, the volume
mount and libvips all line up. It writes a variant record, which is fine here —
the file is written alongside it on the volume.

---

## Phase D — DNS cutover

Lower the TTL on the `mireiazantop.com` and `www.mireiazantop.com` A records to
300 s **at least one old-TTL period before** the cutover, so the switch actually
propagates in minutes.

Then:

1. Point both A records at `$NEW_IP`. **Both**, in one go — `proxy.hosts` in
   `config/deploy.yml` lists the apex and `www`, and a name that does not yet
   resolve to `$NEW_IP` is a failed validation, not a skipped one.
2. Watch kamal-proxy acquire the certificate — the first public request for the
   host triggers the ACME challenge:

   ```sh
   bundle exec kamal proxy logs --follow
   ```

3. Verify:

   ```sh
   curl -sSI https://mireiazantop.com/ca | head -1
   curl -sSI https://www.mireiazantop.com/ca | head -1
   curl -sS -o /dev/null -w "%{http_code}\n" http://mireiazantop.com/ca   # 301 → https
   echo | openssl s_client -connect mireiazantop.com:443 -servername mireiazantop.com 2>/dev/null |
     openssl x509 -noout -dates -issuer
   ```

4. Walk the site by hand: a work page in each of `ca`, `es`, `en`; an image at
   full size; the tag pages; sign in and open the admin bar.
5. Restore the TTL to its previous value once the site is confirmed good.

Leave the legacy droplet running and untouched for at least a week.

### Certificates

`proxy.ssl: true` in `config/deploy.yml` is the whole of the TLS configuration.
kamal-proxy requests a Let's Encrypt certificate over ACME and renews it on its
own: no certbot, no cron job, no certificate files in this repository and nothing
to remember in a year. It replaces the manual ZeroSSL arrangement on the legacy
box, whose certificate expired on 2026-01-14 precisely because it needed
remembering.

Two ways to lose that, both avoidable:

- **Let's Encrypt rate-limits failed validations per hour and issued
  certificates per registered domain per week.** Flipping DNS back and forth to
  retry a failing challenge is the fastest way to lock yourself out for an hour,
  at the one moment when the site is already pointing at the new box. This is why
  Phase C verifies everything reachable without a certificate *before* the switch:
  the DNS change should be a single attempt, not an experiment. If validation does
  fail, read `kamal proxy logs` and fix the cause — an unreachable port 80/443
  from [B1](#b1--create-the-droplet), or a name in `proxy.hosts` that does not
  resolve to `$NEW_IP` — rather than retrying the switch.
- **kamal-proxy holds the issued certificates in its own state.** Removing or
  rebooting the proxy container discards them and re-requests on next boot, which
  spends the same weekly budget. `kamal deploy` boots the proxy only if it is not
  already running and leaves a running one alone, so ordinary deploys are safe;
  `kamal proxy reboot` is the one to think twice about in the first week.

---

## Rollback

**Point the A records back at `198.211.119.133`.** That is the whole procedure.
Phase A never writes to the legacy database and Phase B never touches the legacy
box, so the old app is still sitting there intact.

Two things to know before relying on it:

- **The legacy TLS certificate expired on 2026-01-14 and has not been renewed**
  (recorded in `CLAUDE.md`). Rolling back returns visitors to a site that
  browsers interstitial. Confirm the certificate's state *before* the cutover so
  this is a known cost rather than a discovery.
- **Anything created on the new site after cutover is lost on rollback.** The two
  databases do not converge. If the new site has been live long enough for Mireia
  to have edited anything, dump `zantop_production` before switching back:

  ```sh
  ssh root@$NEW_IP 'docker exec zantop-db pg_dump -U zantop -Fc zantop_production' > ~/zantop-post-cutover.dump
  rsync -avz root@$NEW_IP:/var/lib/zantop/uploads/ ~/zantop-post-cutover-uploads/
  ```

### What rollback is *not*

`bin/rails db:rollback` is not a path back. The migration chain is irreversible
in three separate places, all confirmed in rehearsal:

- `20220406153731_create_friendly_id_slugs` raises `IrreversibleMigration` —
  its `t.change` calls sit inside a `change_table ... bulk` block, so the
  `reversible` down branch never takes effect.
- `20220910125235_translate_rich_texts` fails with a `PG::UniqueViolation`
  restoring the pre-locale unique index, because real data has the same
  `(record_type, record_id, name)` in several locales.
- `20220702222104_create_active_storage_tables` fails on
  `active_storage_variant_records` already having been dropped by
  `20260801140014`'s own rollback.

The new site's database is only ever reachable by restoring a dump.

### Smaller rollbacks

A bad *code* deploy, with the data fine, is a different and much cheaper problem:

```sh
bundle exec kamal app containers        # find the previous version
bundle exec kamal rollback <VERSION>
```

---

## Rehearsal log

Rehearsed 2026-08-02 in the `cutover-runbook` worktree, against the real
production content in `db/dump.sql` (71 works, 403 images, 400 image files, 605
translated rich texts) and the committed `legacy_uploads/` (415 files, 112 MB).

The legacy schema was reconstructed by loading `db/schema.rb`, seeding it, then
rolling back to before `20220702222104_create_active_storage_tables` — which
restores `images.image`, drops the ActiveStorage and ActionText tables, and
leaves the Globalize `*_translations` tables as the only source of translated
content. That is a faithful stand-in for the legacy database from
`CreateActiveStorageTables` onward.

### Measured

Development machine, Postgres 18.4 in Docker. The droplet is smaller; treat
these as lower bounds.

| Step | Time | Result |
| --- | --- | --- |
| `pg_restore` of the legacy dump | 0.18 s | — |
| `db:migrate`, 7 migrations | 0.74 s | no migration above 10 ms |
| ├ `20260801140013` service_name | 2.8 ms | no-op, column already exists |
| ├ `20260801140014` variant_records | 2.5 ms | no-op, `if_not_exists` |
| └ `20260801140015` checksum null | 0.9 ms | no-op, already nullable |
| `rake migrate_translations` | 2.14 s | 605 rich texts from 732 translation rows |
| `rake migrate_images` | **167.19 s** | 400/400 attached, 112 MB → 35 MB |
| Variant smoke test, 5 variants | 1.03 s | thumb/medium/card/large/full all processed |
| `pg_dump -Fc` of the result | 0.11 s | 186 KB |
| `RAILS_ENV=production db:prepare` | 0.71 s | no pending work, Puma would bind at once |

End to end: **under four minutes**, ~95% of it `migrate_images`.

### What broke, and what it means

- **The migration chain is irreversible in three places.** Details under
  [What rollback is *not*](#what-rollback-is-not). This is the single most
  consequential finding: it rules out migrating the live database in place, and
  is why the whole runbook is built around dumping instead.
- **`rake migrate_images` ran clean**: no exceptions, no missing source files,
  400 of 400 images attached. The only `images` rows left without an attachment
  were 13, 39 and 145 — the three Vimeo/YouTube embeds, which have no
  `deprecated_image` and are correctly skipped.
- **`rake migrate_translations` produced 605 rows against 606 in `db/dump.sql`.**
  Not a defect. The extra row is `Tag#37` (`name`/`ca`, "metacroqueta"), which
  has no `tag_translations` row at all — it was created through the app after the
  2022 migration. The reconciliation query in [A4](#a4--schema-migrations-and-translations)
  matched exactly, 605 = 605.
- **A stale `ar_internal_metadata` row is harmless.** Restoring one saying
  `environment=development` and then running `db:prepare` under
  `RAILS_ENV=production` did not raise; Rails 8.1 overwrote it with `production`.
  The `--exclude-table-data` flag in A7 is tidiness, not a fix.
- **`db:migrate` rewrote `db/dump.sql`** every time it ran, via the
  `lib/tasks/db.rake` hook, because the rehearsal ran in development. Noted in
  [A8](#a8--clean-up).

### Not rehearsed

- **The four earliest migrations** (`better_taggings`, `better_sections`,
  `better_images`, `drop_ckeditor_assets`) and `create_friendly_id_slugs`. Their
  legacy shape cannot be reconstructed from the current dump, precisely because
  they are irreversible. They rewrite `taggings`, `sections` and `images` in
  place against real production rows. [A3](#a3--pre-flight-checks-against-the-restored-legacy-data)
  is the check that stands in for a rehearsal; run it and read the output before
  A4.
- **Everything from Phase B onward.** No droplet exists. Command shapes were
  verified against `config/deploy.yml`, `.kamal/secrets`, the `Dockerfile`,
  `bin/docker-entrypoint`, `config/storage.yml` and `kamal config` output
  (Kamal 2.12.0), but none have been run against a host.
- **The Kamal Docker network name** used in [Appendix B](#appendix-b--running-migrate_images-on-the-droplet).
  Confirm with `docker network ls` on the box.
- **A full production boot of the image.** `app/assets/builds/` holds no JS
  bundles in a fresh worktree, so `layouts/application.html.erb` cannot render
  locally. The asset build is baked into the image by CI; the Phase C checks
  cover it.

---

## Appendix A — what changed since this task was written

For anyone reading an older note:

- **Capistrano is gone.** Kamal 2.12.0 replaces it; there are no linked files
  and no linked dirs.
- **`config/credentials/production.key` no longer exists** and there is nothing
  to seed. `config/credentials/production.yml.enc` was deleted because its key
  was unrecoverable; `SECRET_KEY_BASE` is a Kamal secret instead.
- **Uploads are a Kamal volume**, `/var/lib/zantop/uploads` on the host mounted
  at `/data/uploads`, with `config/storage.yml` reading `ZANTOP_STORAGE_ROOT` —
  not a Capistrano linked dir.
- **The cutover is a DNS switch to a new droplet**, not an in-place replacement.
- **The rollback target is 198.211.119.133.** The `188.166.21.208` recorded in
  the old `config/deploy/production.rb` no longer answers at all.

## Appendix B — running `migrate_images` on the droplet

Only if the local route in [Phase A](#phase-a--build-the-migrated-database-and-uploads-locally)
is not available. `legacy_uploads/` is excluded from the image by
`.dockerignore`, so the originals have to be uploaded and bind-mounted into a
one-off container. `kamal app exec` cannot add a mount, so this is a raw
`docker run`.

```sh
rsync -avz legacy_uploads/ root@$NEW_IP:/var/lib/zantop/legacy_uploads/
ssh root@$NEW_IP 'chown -R 1000:1000 /var/lib/zantop/legacy_uploads'

# The exact image tag Kamal is running, and the network it is on:
ssh root@$NEW_IP 'docker ps --filter name=zantop-web --format "{{.Image}}"; docker network ls'
```

Then, with `IMAGE` set to that tag and `NETWORK` to the Kamal network:

```sh
ssh root@$NEW_IP "docker run --rm \
  --network \$NETWORK \
  -v /var/lib/zantop/uploads:/data/uploads \
  -v /var/lib/zantop/legacy_uploads:/rails/legacy_uploads:ro \
  -e RAILS_ENV=production \
  -e ZANTOP_DATABASE_HOST=zantop-db \
  -e ZANTOP_DATABASE_PORT=5432 \
  -e ZANTOP_DATABASE_USER=zantop \
  -e ZANTOP_DATABASE_PASSWORD=\$DB_PASSWORD \
  -e ZANTOP_STORAGE_ROOT=/data/uploads \
  -e SECRET_KEY_BASE=\$SECRET_KEY_BASE \
  --entrypoint bin/rails \
  \$IMAGE migrate_images"
```

`--entrypoint bin/rails` bypasses `bin/docker-entrypoint`, whose `db:prepare`
only fires for `bin/rails server` anyway; skipping it keeps the one-off from
touching the schema. `/rails` is the image's `WORKDIR`, which is what
`Rails.root.join("legacy_uploads", ...)` in `lib/tasks/images.rake` resolves
against.

Budget well over the 167 s measured locally — this is the step the droplet is
least suited to. Then remove the originals:

```sh
ssh root@$NEW_IP 'rm -rf /var/lib/zantop/legacy_uploads'
```
