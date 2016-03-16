class ContactsController < ApplicationController

  def new
  	@contact = Contact.new
	end

  def create 
  	# binding.pry
  	@contact = Contact.new(contact_params)

  	if @contact.save
      # Must install sendgrid w/ credit card in order to use on Heroku
      #sends email when contact form is filled out
      # ContactMailer.contact_email(@contact).deliver_now

  		flash[:notice] = "Submission Successful!"
  		redirect_to root_path
  	else
  		render :new
  	end
  end

  private

  def contact_params
  	params.require(:contact).permit(:name, :email, :message)
  end
end
