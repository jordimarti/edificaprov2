class ClasesPassivhausController < ApplicationController
	before_filter :authenticate_user!
	before_filter :check_clases_access, only: [:z6k9m, :pr6w2, :gc8x, :xk98e, :z48ym, :m3k21, :ap921, :pq4rt, :m5nto, :s34pgk, :s34mls, :d3sc4, :tr4d3s, :tr43x4, :d3s3x4, :la45i8m, :la45i8v, :sob73t, :mh93se, :cp82k7, :coavn7x8, :cp82k7fis, :cp82k7vi, :tr4mas] 

	private
  	def check_clases_access
	    @this_user = User.find(current_user.id)
	    if @this_user.role == 'energiehaus' || @this_user.role == '2'
	    	
	    else
	    	redirect_to clases_passivhaus_restricted_access_path
	    end
	  end

end
