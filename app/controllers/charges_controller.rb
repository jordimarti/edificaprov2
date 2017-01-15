class ChargesController < ApplicationController
  include CourseDetails

  def creditcard
  	@purchase = Purchase.find(params[:purchase_id])
		@course = Course.find(@purchase.course_id)
		@course_name = course_title(@course.id, params[:locale])
		if @purchase.price == 0
			@free_beginning = true
			@purchase.paid = true
			@purchase.refund = false
			@purchase.update_attributes(@purchase.attributes)
		else
			@free_beginning = false
		end
  end

  def pay
  	@purchase = Purchase.find(params[:purchase_id])
		@course = Course.find(@purchase.course_id)
		@course_name = course_title(@course.id, params[:locale])
		#@first_lesson = @course.lessons.order(position: :asc).first
		purchase_description = 'EdificaPRO purchase n: ' + @purchase.id.to_s
		# Get the credit card details submitted by the form
		token = params[:stripeToken]

		# Create the charge on Stripe's servers - this will charge the user's card
		begin
		  charge = Stripe::Charge.create(
		    :amount => @purchase.price, # amount in cents, again
		    :currency => "eur",
		    :card => token,
		    :description => purchase_description
		  )
		rescue Stripe::CardError => e
		  # The card has been declined
		  flash[:error] = e.message
	  	redirect_to action: 'credit_card_error'
		end

		@purchase.paid = true
		@purchase.refund = false
		
		if @purchase.update_attributes(@purchase.attributes)
      flash[:notice] = I18n.t('.purchase_done')
      UserMailer.purchase_email(@purchase, params[:locale]).deliver
    else
    	flash[:error] = I18n.t('.purchase_not_done')
    end
  end

  def credit_card_error
		
	end

	
end
