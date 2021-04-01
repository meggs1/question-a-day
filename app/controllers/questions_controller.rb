class QuestionsController < ApplicationController

    def index
        @questions = Question.all
    end

    def show
        @question = Question.find(params[:id])
        @answer = @question.answers.build(user_id: current_user.id)
    end

end
