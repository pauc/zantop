# syntax=docker/dockerfile:1
# check=error=true

# Production image, built and pushed by .github/workflows/deploy.yml and run by
# Kamal. It does not work for development: bundle and yarn install without
# their development and test groups, and the asset build is baked in.
#
#   docker build -t zantop .
#   docker run -d -p 80:80 -e RAILS_MASTER_KEY=<config/credentials/production.key> zantop

# The versions come from .tool-versions, which stays the single source of truth
# for local work, CI and the image alike.
ARG RUBY_VERSION=4.0.6
ARG NODE_VERSION=26.5.1
ARG YARN_VERSION=1.22.22

FROM docker.io/library/ruby:$RUBY_VERSION-slim AS base

WORKDIR /rails

# Packages needed at runtime. libvips is not optional: image_processing 2.0
# declares no backend, so ruby-vips is what ActiveStorage variants and
# ImageOptimizer both go through, and the app raises LoadError at boot without
# it.
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y \
      curl \
      libjemalloc2 \
      libvips \
      postgresql-client && \
    rm -rf /var/lib/apt/lists /var/cache/apt/archives

ENV RAILS_ENV="production" \
    BUNDLE_DEPLOYMENT="1" \
    BUNDLE_PATH="/usr/local/bundle" \
    BUNDLE_WITHOUT="development:test" \
    RAILS_SERVE_STATIC_FILES="1" \
    RAILS_LOG_TO_STDOUT="1"


# Throw-away build stage, so the compilers and node never reach the final image
FROM base AS build

RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y \
      build-essential \
      git \
      libpq-dev \
      libyaml-dev \
      pkg-config && \
    rm -rf /var/lib/apt/lists /var/cache/apt/archives

# Node from the official prebuilt tarball rather than compiled from source:
# the droplet never builds anything, but a from-source node costs minutes on
# every CI run.
#
# The tarball is x64 because the image is: Gemfile.lock records only the
# x86_64-linux platform, so bundle install under BUNDLE_DEPLOYMENT would fail
# on any other architecture before node ever mattered. Building elsewhere means
# adding the platform to the lockfile first.
ARG NODE_VERSION
ARG YARN_VERSION
ENV PATH=/usr/local/node/bin:$PATH
RUN mkdir -p /usr/local/node && \
    curl -fsSL "https://nodejs.org/dist/v${NODE_VERSION}/node-v${NODE_VERSION}-linux-x64.tar.gz" | \
      tar xz -C /usr/local/node --strip-components=1 && \
    npm install -g "yarn@${YARN_VERSION}"

# Gems first: they change far less often than the application code, so this
# layer stays cached across most builds.
COPY Gemfile Gemfile.lock ./
RUN bundle install && \
    rm -rf ~/.bundle/ "${BUNDLE_PATH}"/ruby/*/cache "${BUNDLE_PATH}"/ruby/*/bundler/gems/*/.git && \
    bundle exec bootsnap precompile --gemfile

COPY package.json yarn.lock ./
RUN yarn install --frozen-lockfile

COPY . .

RUN bundle exec bootsnap precompile app/ lib/

# cssbundling-rails and jsbundling-rails hook `yarn build:css` and `yarn build`
# onto assets:precompile, so this one command runs sass, esbuild and sprockets.
# SECRET_KEY_BASE_DUMMY lets it boot the production environment without the
# real key; nothing here reads the encrypted credentials, because
# config/database.yml takes its production credentials from the environment.
RUN SECRET_KEY_BASE_DUMMY=1 ./bin/rails assets:precompile

# Yarn leaves node_modules behind for the COPY below to skip; drop it so the
# stage is not needlessly large in the layer cache.
RUN rm -rf node_modules


# Final image
FROM base

COPY --from=build "${BUNDLE_PATH}" "${BUNDLE_PATH}"
COPY --from=build /rails /rails

# Run as an unprivileged user, and own only what has to be written at runtime.
# ZANTOP_STORAGE_ROOT is a Kamal volume owned by the host, so its ownership is
# fixed there, not here.
RUN groupadd --system --gid 1000 rails && \
    useradd rails --uid 1000 --gid 1000 --create-home --shell /bin/bash && \
    chown -R rails:rails db log tmp
USER 1000:1000

ENTRYPOINT ["/rails/bin/docker-entrypoint"]

# Thruster terminates the connection, gzips and caches assets, and hands the
# rest to Puma on 3000. kamal-proxy talks to this port.
EXPOSE 80
CMD ["./bin/thrust", "./bin/rails", "server"]
