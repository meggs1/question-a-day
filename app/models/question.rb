class Question < ActiveRecord::Base
    has_many :answers
    has_many :question_tags
    has_many :users, through: :answers
    has_many :tags, through: :question_tags
end