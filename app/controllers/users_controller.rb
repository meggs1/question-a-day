class UsersController < ApplicationController

    def new
        @user= User.new
    end

    def create
        user = User.create(user_params)
        if user.save
            session[:user_id] = user.id
            redirect_to user_path(user)
        else
            redirect_to new_user_path
        end
    end

    def show
        @user = User.find_by(params[:id])
        @todays_question = Question.todays_question
        @user_answer = @todays_question.answers.find_by(user_id: current_user.id)
        @top_questions = Question.most_answered
    end

    private
    
    def user_params
        params.require(:user).permit(:name, :email, :password)
    end
end
