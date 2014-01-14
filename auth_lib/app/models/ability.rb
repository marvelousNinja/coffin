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
      if options['filters'].present? && options['filters']['user_id'].to_i == @user.uid
        options['filters']['user_id'] = @user.id
      end

      if subject = options['subject']
        if subject.camelize == subject
          options['subject'] = subject.constantize
        else
          options['subject'] = options['subject'].try(:to_sym)
        end
      end

      can options['action'].try(:to_sym), options['subject'], options['filters'].try(:deep_symbolize_keys)
    end
  end
end
