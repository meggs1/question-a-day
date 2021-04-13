class Question < ActiveRecord::Base
    has_many :answers
    has_many :question_tags
    has_many :users, through: :answers
    has_many :tags, through: :question_tags
    
    validates :name, presence: true, uniqueness: true

    def self.most_answered
        all.joins(:answers).group("question_id").order("count(question_id) desc").limit(5)
    end

    # def is_answered?
    #     if self.answers.blank? || self.answers.nil?
    #         false
    #     else
    #         true
    #     end
    # end

end