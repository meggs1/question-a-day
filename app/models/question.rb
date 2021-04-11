class Question < ActiveRecord::Base
    has_many :answers
    has_many :question_tags
    has_many :users, through: :answers
    has_many :tags, through: :question_tags
    
    validates :name, presence: true, uniqueness: true

    #validates new_question (user can only answer a question they haven't answered yet)
    #validates who, what, where, when or why

    def self.most_answered
        @popular_questions = joins(:answers).group(:question_id).order("count(question_id) desc").limit(5)
    end

    def self.todays_question
        questions = self.all
        date = Date.today.yday
        questions[date % questions.size]
    end
    
    def is_answered?
        if self.answers.blank? || self.answers.nil?
            false
        else
            true
        end
    end

end