class ContactsController < ApplicationController

  def new
  	@contact = Contact.new
	end

  def create 
  	# binding.pry
  	@contact = Contact.new(contact_params)

  	if @contact.save
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