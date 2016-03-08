class ContactController < ApplicationController
  
  def index
  	@contact = Contact.new
  end

  def show
  end

  def new
  	@contact = Contact.new
	end

  def create 
  	@contact = Contact.new(contact_params)

  	if @contact.save
  		flash[:notice] = "Submission Successful!"
  		redirect_to root_path
  	else
  		render :index
  	end
  end

  def contact_params
  	params.require(:contact).permit(:name, :email, :message)
  end
end
