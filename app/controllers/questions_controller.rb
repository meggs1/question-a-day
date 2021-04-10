class QuestionsController < ApplicationController

    # def new
    #     @question = Question.new
    #     @tags = Tag.all
    # end

    # def create
    #     question = Question.create(question_params)
    #     if question.save
    #         redirect_to question_path(question)
    #     else
    #         render :new
    #     end
    # end

    def index
        @questions = Question.all
    end

    def show
        @question = Question.find(params[:id])
        @user_answer = @question.answers.find_by(user_id: current_user.id)
        @answer = @question.answers.build(user_id: current_user.id)
        # @answer = @question.answers.find_or_create_by(user_id: current_user.id)
    end

    def edit
        @question = Question.find(params[:id])
    end

    def update
        question = Question.find(params[:id])
        if question.update(question_params)
            redirect_to question_path(question)
        else
            render :edit
        end
    end

    def popular_questions
        @popular_questions = Question.most_answered
    end

    private

    def question_params
        params.require(:question).permit(:name, tag_ids:[])
    end

end
