class User < ApplicationRecord
	has_secure_password

	EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	validates :username, presence: true, length: {maximum: 80}
	validates :password, presence: true, length: {minimum: 8}
	validates :password_confirmation, length: { minimum: 8 }, presence: true
	validates :email, presence: true, format: { with: EMAIL }, uniqueness: true
end
