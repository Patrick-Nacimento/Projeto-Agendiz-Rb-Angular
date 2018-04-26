class Mailer < ApplicationMailer
  default from: "intranet@gmail.com"

  layout false

  def reset_password(recipient, token)
    @user = recipient
    @token = token

    mail(to: recipient.email)
  end

end
