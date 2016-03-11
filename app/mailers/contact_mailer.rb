class ContactMailer < ApplicationMailer
	
	default from: ENV['ADMINISTRATOR_EMAIL']

	def contact_email(contact)
		@contact = contact
		@url = 'https://motivates.herokuapp.com/contacts/new'
		mail to: ENV['ADMINISTRATOR_EMAIL'], subject: "Getting in Touch"
	end
end