# Preview all emails at http://localhost:3000/rails/mailers/user_confirmation
class UserConfirmationPreview < ActionMailer::Preview
  
  def confirmation 
    UserConfirmationMailer.confirmation(User.first)
  end
end
