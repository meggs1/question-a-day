require 'date'
class Question < ActiveRecord::Base
    has_many :answers
    has_many :question_tags
    has_many :users, through: :answers
    has_many :tags, through: :question_tags

    #validates new_question (user can only answer a question they haven't answered yet)
    #validates who, what, where, when or why

end