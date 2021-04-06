class User < ActiveRecord::Base
    has_secure_password
    has_many :answers
    has_many :comments, through: :answers

    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true

    def self.from_omniauth(auth)
        self.find_or_create_by(provider: auth[:provider], uid: auth[:uid]) do |u|
            u.username = auth[:info][:name]
            u.email = auth[:info][:email]
            u.password = SecureRandom.hex(20)
        end
    end
end