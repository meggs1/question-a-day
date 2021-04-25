class QuestionsController < ApplicationController
    before_action :find_question, only: [:show, :edit, :update]
    
    def index
        @questions = Question.all
    end

    def show
        @user_answer = @question.answers.find_by(user_id: current_user.id)
        @tags = @question.tags.all
    end

    def edit
    end

    def update
        if @question.update(question_params)
            redirect_to question_path(@question)
        else
            render :edit
        end
    end

    def popular_questions
        @popular_questions = Question.most_answered
    end

    def todays_question
        @user_answer = helpers.todays_question.answers.find_by(user_id: current_user.id)
    end

    private

    def question_params
        params.require(:question).permit(:name, tag_ids:[])
    end

    def find_question
        @question = Question.find(params[:id])
    end
end
