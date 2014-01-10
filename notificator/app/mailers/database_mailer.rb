class DatabaseMailer < ActionMailer::Base
  append_view_path MailTemplate::Resolver.instance
  default from: 'mail@example.com'
end
