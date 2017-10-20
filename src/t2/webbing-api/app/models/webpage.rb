class Webpage < ApplicationRecord
	
	validates :title, presence: true, length: {maximum: 80}
	validates :description, presence: true, length: {maximum: 240}
	validates :body, presence: true
	validates :url, presence: true, uniqueness: true
	validates :author, presence: true, length: {maximum: 80}
end
