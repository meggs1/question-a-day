class AnswersController < ApplicationController
    before_action :find_answer, only: [:show, :edit, :update, :destroy]

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
    end

    def edit
    end

    def update
        if @answer.update(answer_params)
          redirect_to answer_path(@answer)
        else
          render :edit
        end
    end

    def destroy
        @answer.destroy
        redirect_to answers_path
    end

    private

    def answer_params
        params.require(:answer).permit(:user_id, :question_id, :content)
    end

    def find_answer
        @answer = Answer.find_by_id(params[:id])
    end
end
