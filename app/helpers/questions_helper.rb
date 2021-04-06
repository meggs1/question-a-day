module QuestionsHelper

    def todays_question
        questions = Question.all
        questions[Date.today.hash % questions.size]
    end
    
end
