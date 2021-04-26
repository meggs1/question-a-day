module UsersHelper
    def is_admin?(user)
        user.admin == true
    end
end
