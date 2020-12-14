class User < ApplicationRecord
  has_secure_password
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  
  has_many :todos, dependent: :delete_all
  before_save { self.email = email.downcase }
  
  validates :name, presence: true, length: { maximum: 24 }
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
             uniqueness: { case_sensitive: false, 
                           message: -> (object, data) do 
                              "#{data[:value]} is already taken. Please login instead."
                           end }
  
  validates :password, length: { minimum: 6, on: :create, on: :update }
  validates :password_confirmation, presence: { on: :create, on: :update }
end
