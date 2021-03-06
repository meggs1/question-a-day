class AnswersController < ApplicationController
    before_action :find_answer, only: [:show, :edit, :update, :destroy]
    before_action :find_question, only: [:new, :index, :edit]
    before_action :check_current_user, only: [:show, :edit, :update, :destroy]
    before_action :find_user, only: [:index]

    def new
        if @question.users.include?(current_user)
            flash[:warning] = 'You have already answered this question.'
            redirect_to question_path(@question)
        else
            @answer = @question.answers.build
        end
    end
    
    def create
       @answer = current_user.answers.build(answer_params)
        if @answer.save
            redirect_to answer_path(@answer)
        else
            render :new
        end
    end

    def index
        if @question.nil?
            record_not_found
        else
            @answers = @question.answers.all
        end
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
        redirect_to question_path(@answer.question)
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

    def find_user
        @user = User.find_by_id(params[:user_id])
    end

    def check_current_user
        if @answer.user != current_user
            invalid_user
        end
    end
end
