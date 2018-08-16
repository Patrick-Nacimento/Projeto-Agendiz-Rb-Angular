class Integration < ApplicationRecord
  self.table_name = 'integrations'

  require 'securerandom'

  #Soft delete
  acts_as_paranoid

  #Concerns

  #Enumerate

  #Associations

  #Scopes

  #Callbacks
  before_validation :generate_secret_key, on: :create

  #Validations
  validates :name, :auth_key,
            presence: true, length: {maximum: 255}


  def self.check_auth(params_authkey, request_authkey)
    ::Integration.where(auth_key: params_authkey||request_authkey).any?
  end

  private

  def generate_secret_key
    self.auth_key = SecureRandom.hex(10) if self.auth_key.nil?
  end
end
