class UserConfirmationMailer < ApplicationMailer

  def confirmation(user)
    @user = user
    mail(:to => @user.email, :subject => 'Activate your account')
  end
end
