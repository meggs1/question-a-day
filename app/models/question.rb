class Question < ActiveRecord::Base
    has_many :answers
    has_many :question_tags
    has_many :users, through: :answers
    has_many :tags, through: :question_tags

    # scope :most_answered, -> {self.joins(:answers).group("question_id").order("count(user_id) desc").limit(5)}
    scope :most_answered, -> {    self.joins(:answers).select("question_id").group("answers.question_id").order("COUNT(user_id) DESC").limit(5)}

    def self.todays_question
        questions = Question.all
        date = Date.today.yday
        questions[(date - 1) % questions.size]
    end
end