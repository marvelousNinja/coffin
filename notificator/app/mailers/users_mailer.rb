class UsersMailer < DatabaseMailer
  def welcome
    mail to: 'example@mail.com',
         subject: 'example@mail.com'
  end
end
