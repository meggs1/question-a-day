class Question < ActiveRecord::Base
    has_many :answers
    has_many :question_tags
    has_many :users, through: :answers
    has_many :tags, through: :question_tags
    
    validates :name, presence: true, uniqueness: true

    #validates new_question (user can only answer a question they haven't answered yet)
    #validates who, what, where, when or why

    def self.most_answered
        @top_questions = joins(:answers).group(:question_id).order("count(question_id) desc").limit(3)
    end

    def is_answered?
        if self.answers.blank? || self.answers.nil?
            false
        else
            true
        end
    end

end