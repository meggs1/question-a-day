class AnswersController < ApplicationController

    def new
        if params[:question_id] && !question.exists?(params[:question_id])
            redirect_to questions_path
          else
            @answer = Answer.new(answer_params)
        end
    end
    
    def create
       @answer = Answer.new(answer_params)
        if @answer.save
            redirect_to answer_path(@answer)
        else
            render :new
        end
    end

    def index
        @answers = current_user.answers.all
    end

    def show
        @answer = Answer.find_by(params[:id])
        @question = Question.find_by(params[:question_id])
    end

    private

    def answer_params
        params.require(:answer).permit(:user_id, :question_id, :content)
    end

end
