class Answer < ActiveRecord::Base
    belongs_to :user
    belongs_to :question

    def question_name
        self.try(:question).try(:name)
    end

    def question_name(name)
        question = Question.find_by(name: name)
        self.question = question
    end
end