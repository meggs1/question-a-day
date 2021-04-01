class User < ActiveRecord::Base
    has_secure_password
    has_many :answers
    has_many :comments, through: :answers
end