class ContactController < ApplicationController
  
  def index
  	@contact = Contact.new
  end

  # def show
  # end

  def new
  	@contact = Contact.new
	end
# Make a create_form similarly to login_form with admin. Then make a post request from that. Form is not submitting data. 
  def create 
  	# binding.pry
  	@contact = Contact.new(contact_params)

  	if @contact.save
  		flash[:notice] = "Submission Successful!"
  		redirect_to root_path
  	else
  		render :index
  	end
  end

  private

  def contact_params
  	params.require(:contact).permit(:name, :email, :message)
  end
end
