class WelcomeController < ApplicationController
  def index
    if current_user
      redirect_to todays_question_path
    end
  end
end
