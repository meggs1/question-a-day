class QuestionsController < ApplicationController

    def new
        @question = Question.new
        @tags = Tag.all
    end

    def create
        question = Question.create(question_params)
        if question.save
            redirect_to question_path(question)
        else
            render :new
        end
    end

    def index
        @questions = Question.all
    end

    def show
        @question = Question.find(params[:id])
        @answer = @question.answers.build(user_id: current_user.id)
    end

    private

    def question_params
        params.require(:question).permit(:name, tag_ids:[])
    end

end
