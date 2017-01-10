class LibraryController < ApplicationController
  def index
  end

  def course
		
	end

	def subcourses
		@course = Course.find(params[:id])
    @subcourses = Subcourse.where(:course_id => @course.id)
	end

	def passivhaus
		@course = Course.find(1)
		if defined? current_user.id
    	@user_purchase = Purchase.where(user_id: current_user.id, course_id: @course.id, paid: 't')
    end
	end

	def show
		@subcourse = Subcourse.find(params[:id])
		@sections = Section.where(:subcourse_id => @subcourse.id)
		@lessons = Lesson.where(:subcourse_id => @subcourse.id).order(position: :asc)
		@first_lesson = @subcourse.lessons.order(position: :asc).first
	end
end
