require 'securerandom'

class User < ApplicationRecord
  before_create :generate_email_token, :generate_api_key
  has_secure_password

  validates_presence_of :name
  validates :email, uniqueness: true, presence: true
  validates :password, presence: true, allow_nil: true

  def email_activate
    self.email_confirmed = true
    self.email_token = nil
    save!
  end

  private

  def generate_email_token
    self.email_token = SecureRandom.urlsafe_base64
  end

  def generate_api_key 
    self.api_key = SecureRandom.uuid 
  end
end
