class User < ActiveRecord::Base
    has_many :answers
    has_many :comments, through: :answers
end