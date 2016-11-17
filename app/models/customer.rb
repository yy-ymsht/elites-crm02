class Customer < ActiveRecord::Base
	belongs_to :company

	validates :family_name,
	  presence: true, length: { maximum: 20 }
	validates :given_name,
	  presence: true, length: { maximum: 20 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email,
	  presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: true
	validates :company_id, presence: true

	def full_name
	# return family_name + given_nameの略
		family_name + given_name
	end
end
