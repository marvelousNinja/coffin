class Ability
  include CanCan::Ability

  def initialize(user)
    permission_options = get_cached_permission_options(user) || []

    if permission_options.blank?
      permission_options = build_permission_options(user)
      cache_permission_options(user, permission_options)
    end

    set_permissions(permission_options)
  end

  protected

  def get_cached_permission_options(user)
    Rails.cache.read([:user, :permissions, user.id])
  end

  def cache_permission_options(user, permission_options)
    Rails.cache.write([:user, :permissions, user.id], permission_options)
  end

  def set_permissions(permission_options)
    permission_options.each { |options| can options[:action], options[:subject], options[:filters] }
  end

  def build_permission_options(user)
    user.permissions.map do |permission|
      options = {
        action: permission.action.to_sym
      }

      if permission.subject.present?
        if permission.subject.capitalize == permission.subject
          options[:subject] = permission.subject.constantize
          if permission.owning_required?
            options[:filters] = {
              user_id: user.id
            }
          elsif permission.subject_id.present?
            options[:filters] = {
              id: permission.subject_id
            }
          end
        else
          options[:subject] = permission.subject.to_sym
        end
      end
      options
    end
  end
end
