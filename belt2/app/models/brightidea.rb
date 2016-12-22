class Brightidea < ActiveRecord::Base
  	belongs_to :user
	has_many :likes, dependent: :destroy
	has_many :users_like, through: :likes, as: :users

	validates :idea, presence: true

end
