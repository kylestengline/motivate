class ContactMailer < ApplicationMailer
	
	# default from: ENV['ADMINISTRATOR_EMAIL']

	# Must install sendgrid w/ credit card in order to use on Heroku
	# def contact_email(contact)
	# 	@contact = contact
	# 	@url = 'https://motivates.herokuapp.com/contacts/new'
	# 	mail to: ENV['ADMINISTRATOR_EMAIL'], subject: "Getting in Touch"
	# end
end