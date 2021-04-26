class ClasesPassivhausController < ApplicationController
	before_filter :authenticate_user!
	before_filter :check_clases_access, only: [:tp11n8, :tp11ex4, :cp82k7, :cp1xd9, :cp1xd9fis, :cp13x4, :tp1er9, :tp1ex4, :ph1xd2, :tp1ab9, :cp4ab9, :cp4ex9] 

	private
  	def check_clases_access
	    @this_user = User.find(current_user.id)
	    if @this_user.role == 'energiehaus' || @this_user.role == '2'
	    	
	    else
	    	redirect_to clases_passivhaus_restricted_access_path
	    end
	  end

end
