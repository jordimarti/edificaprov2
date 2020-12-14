class IntroPassivhausController < ApplicationController
  before_filter :authenticate_user!
  #before_filter :check_purchase

  def index
  end

  private
  	def check_purchase
	    @course = Course.find(1)
	    @this_user = User.find(current_user.id)
	    user_purchases = @this_user.purchases
	    if user_purchases.where(:course_id => @course.id, :paid => true).blank?
	      redirect_to library_passivhaus_path
	    end
	  end
end
