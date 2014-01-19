class Ability
  include CanCan::Ability

  def initialize(user)
    @user = user
    build_permissions permission_options
  end

  protected

  def permission_options
    @permission_options ||= request_permissions
  end

  def request_permissions
    config = Devise.omniauth_configs[:centralized_auth].strategy
    client = OAuth2::Client.new(config.client_id, config.client_secret, config.client_options.deep_symbolize_keys)
    token = OAuth2::AccessToken.new(client, @user.access_token)
    token.get('/my_permissions').parsed
  end

  def build_permissions(permission_options)
    permission_options.each do |options|
      action = build_action options
      subject = build_subject options
      filters = build_filters options

      can action, subject, filters
    end
  end

  def build_filters(options)
    filters = options['filters']
    filters.deep_symbolize_keys!
    if filters[:user_id] && filters[:user_id].to_i == @user.id.to_i
      filters[:user_id] = @user.id
    end
    filters
  end

  def build_action(options)
    options['action'].to_sym
  end

  def build_subject(options)
    subject = nil
    raw_subject = options['subject']
    if raw_subject.present?
      if raw_subject.to_s.camelize == raw_subject.to_s
        if subject = suppress(NameError) { raw_subject.to_s.camelize.constantize }
          subject
        else
          subject = raw_subject
        end
      else
        subject = raw_subject.to_sym
      end
    end
    subject
  end
end
