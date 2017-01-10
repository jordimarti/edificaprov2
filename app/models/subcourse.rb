class Subcourse < ApplicationRecord

	belongs_to :course
	has_many :sections
	has_many :lessons

end
