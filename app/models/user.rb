class User < ActiveRecord::Base
  has_secure_password
  has_many :messages
  has_many :chatrooms, through: :messages
end
