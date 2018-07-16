class User < ApplicationRecord

    has_many :roles
    
    def add_role(role)
        roles.create(kind: role)
    rescue ActiveRecord::RecordNotUnique
        nil
    end
    
    def remove_role(role)
        roles.where(kind: role).destroy_all
    end

    def full_name
        "#{first_name} #{last_name}"
    end
end
