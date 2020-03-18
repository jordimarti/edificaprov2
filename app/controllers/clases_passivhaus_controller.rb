class ClasesPassivhausController < ApplicationController
	before_filter :authenticate_user!
	before_filter :check_clases_access, only: [:z6k9m, :pr6w2, :gc8x, :xk98e] 

	private
  	def check_clases_access
	    @this_user = User.find(current_user.id)
	    if @this_user.id == 1 || @this_user.id == 726 || @this_user.id == 1527 || @this_user.id == 1531 || @this_user.id == 1532  || @this_user.id == 1533  || @this_user.id == 1534  || @this_user.id == 1535  || @this_user.id == 1536  || @this_user.id == 1537  || @this_user.id == 1538  || @this_user.id == 1539  || @this_user.id == 1540  || @this_user.id == 1541  || @this_user.id == 1542
	    	
	    else
	    	redirect_to clases_passivhaus_restricted_access_path
	    end
	  end

end
