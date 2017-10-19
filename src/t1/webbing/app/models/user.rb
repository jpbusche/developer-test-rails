class User < ApplicationRecord
	has_secure_password
	has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100#" }, :default_url => "/images/:style/missing.png"

	EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
	validates :username, presence: true, length: {maximum: 80}
	validates :password, presence: true, length: {minimum: 8}
	validates :password_confirmation, length: { minimum: 8 }, presence: true
	validates :email, presence: true, format: { with: EMAIL }, uniqueness: true
end
