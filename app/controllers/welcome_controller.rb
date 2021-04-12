class WelcomeController < ApplicationController
  def index
    @todays_question = Question.todays_question
    if current_user
      redirect_to user_path(current_user)
    end
  end
end
