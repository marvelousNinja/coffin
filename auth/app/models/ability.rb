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
      action = build_action permission
      subject = build_subject permission
      filters = build_filters permission
      { action: action, subject: subject, filters: filters }
    end
  end

  def build_action(permission)
    permission.action.to_sym
  end

  def build_filters(permission)
    filters = {}

    if permission.owning_required
      filters[:user_id] = @user_id
    end

    if permission.subject_id.present?
      filters[:id] = permission.subject_id
    end

    permission.conditions.each do |condition|
      filters[condition.field.to_sym] = condition.value
    end

    filters
  end

  def build_subject(permission)
    subject = nil
    if permission.subject.present?
      if permission.subject.to_s.camelize == permission.subject
        klass = suppress(NameError) { permission.subject.to_s.camelize.constantize }
        if klass
          subject = klass
        else
          subject = permission.subject
        end
      else
        subject = permission.subject.to_sym
      end
    end
  end
end
