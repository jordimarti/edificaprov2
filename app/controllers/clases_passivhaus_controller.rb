class ClasesPassivhausController < ApplicationController
	before_filter :authenticate_user!
	before_filter :check_clases_access, only: [:index] 

	private
  	def check_clases_access
	    @this_user = User.find(current_user.id)
	    if @this_user.id == 1 || @this_user.id == 726 || @this_user.id == 728 || @this_user.id == 729 || @this_user.id == 730 || @this_user.id == 731 || @this_user.id == 732
	    	
	    else
	    	redirect_to clases_passivhaus_restricted_access_path
	    end
	  end

end
