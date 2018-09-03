require "rails_helper"

RSpec.describe UserConfirmationMailer, type: :mailer do
  describe 'confirmation' do
  let(:user) { mock_model User, id: 1, name: 'test', email: 'test@gmail.com', password_digest: 'rrtgf', email_confirmed: false, email_token: 'erthgf', api_key: 'aterhgf' }
  let(:mail) { UserConfirmationMailer.confirmation(user).deliver_now }

    it 'renders the subject' do
      expect(mail.subject).to eq('Activate your account')
    end

    it 'renders the receiver email' do
      expect(mail.to).to eq([user.email])
    end

    it 'renders the api_key' do
      expect(mail.body.encoded).to have_content("Your API Key: #{user.api_key}")
      expect(mail.body.encoded).to have_content("Thanks for signing up, #{user.name}!")
    end
  end
end

