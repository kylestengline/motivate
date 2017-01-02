require 'capybara/rails'

module SpecTestHelper
  def login_as(user)
    user.login
  end
end
