module QuestionsHelper
    def todays_question
        questions = Question.all
        date = Date.today.yday
        questions[(date - 1) % questions.size]
    end

    def user_answered?(question)
        user_answer(question) ? true : false
    end

    def user_answer(question)
        question.answers.find_by(user_id: current_user.id)
    end
end
