# frozen_string_literal: true

# The request-wide facts the models need but have no way to ask for. Right now
# that is only who is looking: `Work.visible` has to answer one thing for the
# site owner and another for the internet, and threading a flag from every
# controller through every scope and view would leave the next call site free
# to forget it — the failure `Authorization` was written to prevent.
#
# The Rails executor resets this between requests, so anything running outside
# one — a console, a rake task, a job — sees `user` as nil and gets the public
# answer. Deny by default here too.
class Current < ActiveSupport::CurrentAttributes
  attribute :user
end
