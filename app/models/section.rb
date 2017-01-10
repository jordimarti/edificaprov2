class Section < ApplicationRecord

	belongs_to :subcourse
	has_many :lessons

end
