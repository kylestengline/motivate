class WelcomeController < ApplicationController
	
	def index
		@quotes = [
      "The starting point of all achievement is desire.", 
			"If you do what you always did, you will get what you always got.", 
			"The ones who are crazy enough to think they can change the world, are the ones that do.", 
			"First say to yourself what you would be; and then do what you have to do.", 
			"Whatever the mind can conceive and believe, the mind can achieve.", 
			"Every accomplishment begins with the decision to try.", 
			"Better a diamond with a flaw than a pebble without one."
		].sample
		# add an author to these 
		# binding.pry
	end
end
