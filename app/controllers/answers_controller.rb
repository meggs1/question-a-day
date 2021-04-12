class AnswersController < ApplicationController
    before_action :find_answer, only: [:show, :edit, :update, :destroy]

    def new
        if params[:question_id] && find_question
            @answer = @question.answers.build
        end
    end
    
    def create
       @answer = current_user.answers.build(answer_params)
        if @answer.valid?
            redirect_to answer_path(@answer)
        else
            render :new
        end
    end

    def index
        if params[:question_id] && find_question
            if @question.nil?
            redirect_to root_path
            else
                @answers = @question.answers.all
            end
        end
    end

    def show
    end

    def edit
        if params[:question_id] && find_question
            @answer = @question.answers.find_by(id: params[:id])
        end
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
        redirect_to root_path
    end

    private

    def answer_params
        params.require(:answer).permit(:user_id, :question_id, :content)
    end

    def find_answer
        @answer = Answer.find_by_id(params[:id])
    end

    def find_question
        @question = Question.find_by_id(params[:question_id])
    end
end
