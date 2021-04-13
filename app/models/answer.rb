class Answer < ActiveRecord::Base
    belongs_to :user
    belongs_to :question

    validates :content, presence: true, length: { in: 20..500 }
end