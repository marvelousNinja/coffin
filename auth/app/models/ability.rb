class Ability
  include CanCan::Ability

  def initialize(user)
    @user = user
    set_permissions(permission_options)
  end

  def permission_options
    @permission_options ||= build_permission_options#get_cached_permission_options || build_permission_options || []
  end

  protected

  def get_cached_permission_options
    Rails.cache.read([:user, :permissions, @user.id])
  end

  def cache_permission_options(*permissions)
    Rails.cache.write([:user, :permissions, @user.id], [*permissions])
  end

  def set_permissions(permissions)
    permissions.each { |options| can options[:action], options[:subject], options[:filters] }
  end

  def build_permission_options
    @user.permissions.map do |permission|
      options = {
        action: permission.action.to_sym
      }

      if permission.subject.present?
        if permission.subject.capitalize == permission.subject
          options[:subject] = permission.subject.constantize
          if permission.owning_required?
            options[:filters] = {
              user_id: @user.id
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
      cache_permission_options(options)
      options
    end
  end
end
