class WelcomeController < ApplicationController
  def index
    @todays_question = Question.todays_question
    if current_user
      redirect_to todays_question_path
    end
  end
end
