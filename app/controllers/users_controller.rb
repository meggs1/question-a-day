class UsersController < ApplicationController

    def new
        @user= User.new
    end

    def create # dont render new form redirect
        user = User.create(user_params)
        if user.save
            redirect_to user_path(user)
        else
            redirect_to new_user_path
        end
    end

    def show # show all of user's answers
    end

    private
    
    def user_params
        params.require(:user).permit(:name, :username, :password)
    end

end
