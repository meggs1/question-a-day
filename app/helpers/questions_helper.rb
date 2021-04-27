module QuestionsHelper
    def user_answered?(question)
        user_answer(question) ? true : false
    end

    def user_answer(question)
        question.answers.find_by(user_id: current_user.id)
    end
end
