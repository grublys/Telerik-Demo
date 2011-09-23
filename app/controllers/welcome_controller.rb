class WelcomeController < ApplicationController
  skip_before_filter :require_login

  def index
    redirect_to contacts_url if current_user
  end

end
