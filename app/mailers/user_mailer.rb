class UserMailer < ApplicationMailer
	default from: 'support@edificapro.com'
	include CourseDetails

	def welcome_email(user)
		@user = user
		@url = 'https://www.edificapro.com'
		mail(to: @user.email, from: "EdificaPRO <support@edificapro.com>", subject: 'Bienvenido/a a EdificaPRO')
	end

	def purchase_email(purchase, locale)
		@course = Course.find(purchase.course_id)
		@course_name = course_title(@course.id, locale)
		@user_details = User.find(purchase.user_id)
		@purchase_details = Purchase.find(purchase.id)
		mail(to: [@user_details.email, 'jordi.marti@edificapro.com'], from: "EdificaPRO <support@edificapro.com>", :subject =>
		"Compra del curso")
	end

end
