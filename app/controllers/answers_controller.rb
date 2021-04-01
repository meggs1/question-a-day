class AnswersController < ApplicationController
    def create
        answer = Answer.new(answer_params)
    end

    private

    def answer_params
        params.require(:answer).permit(:user_id, :question_id, :content)
    end

end
