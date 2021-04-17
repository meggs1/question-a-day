module QuestionsHelper
    def todays_question
        questions = Question.all
        date = Date.today.yday
        questions[(date - 1) % questions.size]
    end
end
