class User < ActiveRecord::Base
	has_many :likes, dependent: :destroy
	has_many :brightideas
	has_many :brightideas_like, through: :likes, as: :brightideas
	
	has_secure_password
	
	validates :first_name, :last_name, presence: true, length: {in: 2..30 }
	validates :email, presence: true, uniqueness: {case_sensitive: false}
	validates :password, confirmation: true

	before_save do
		self.email.downcase!
	end

end
