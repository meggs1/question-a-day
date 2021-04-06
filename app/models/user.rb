class User < ActiveRecord::Base
    has_secure_password
    has_many :answers
    has_many :comments, through: :answers

    validates :name, presence: true
    validates :email, presence: true
    validates :password, presence: true

    def self.from_omniauth(response)
        User.find_or_create_by(uid: response[:uid], provider: response[:provider]) do |u|
            u.name = response[:info][:name]
            u.email = response[:info][:email]
            u.password = SecureRandom.hex(15)
        end
    end
end