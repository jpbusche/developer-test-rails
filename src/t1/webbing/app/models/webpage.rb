class Webpage < ApplicationRecord
	has_attached_file :logo, :styles => { :medium => "300x300>", :thumb => "100x100#" }, :default_url => "/images/:style/missing.png"

	validates_attachment_content_type :logo, :content_type => /\Aimage\/.*\Z/
	validates :title, presence: true, length: {maximum: 80}
	validates :description, presence: true, length: {maximum: 240}
	validates :body, presence: true
	validates :url, presence: true, uniqueness: true
	validates :author, presence: true, length: {maximum: 80}
end
