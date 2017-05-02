class Course < ApplicationRecord

	has_many :subcourses
	has_many :purchases

end
