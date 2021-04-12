module QuestionsHelper
    def todays_question #add extra day for leap year to seed
        questions = Question.all
        date = Date.today.yday
        questions[(date - 1) % questions.size]
    end
end
