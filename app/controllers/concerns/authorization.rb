# frozen_string_literal: true

# Closes every action of the including controller to anonymous visitors, and
# reopens only the ones named in `allow_anonymous`.
#
# The list runs that way round on purpose. Naming the protected actions leaves
# an action added later open until somebody remembers to add it, which is how
# the whole admin area came to answer 200 to the internet; naming the public
# ones leaves it closed until somebody opens it on purpose.
module Authorization
  extend ActiveSupport::Concern

  included do
    class_attribute :anonymous_actions, instance_writer: false, default: []

    before_action :authorize_admin
  end

  class_methods do
    def allow_anonymous(*actions)
      self.anonymous_actions = anonymous_actions + actions.map(&:to_s)
    end
  end

  private

  def authorize_admin
    return if current_user?
    return if anonymous_actions.include?(action_name)

    store_location
    flash[:error] = t("restricted_access")

    redirect_to login_path
  end
end
