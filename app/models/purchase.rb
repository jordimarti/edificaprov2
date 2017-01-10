class Purchase < ApplicationRecord

	validates :terms_of_service, presence: true

	belongs_to :user
	belongs_to :course

end
