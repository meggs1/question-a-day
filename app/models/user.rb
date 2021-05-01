class User < ActiveRecord::Base
    has_secure_password
    has_many :answers
    has_many :questions, through: :answers

    validates :name, :email, :password, presence: true
    validates :email, uniqueness: true

    def self.from_omniauth(auth)
        self.find_or_create_by(provider: auth['provider'], uid: auth['uid']) do |u|
            u.name = auth['info']['first_name']
            u.email = auth['info']['email']
            u.password = SecureRandom.hex(20)
        end
    end

end