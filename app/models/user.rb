class User < ApplicationRecord
  authenticates_with_sorcery!

    ROLE_KINDS = %w[
        student
        teacher
        custodian
        administrator
    ].freeze

    serialize :roles, Array

    def add_role(role)
        new_roles = roles.push(role).uniq
        filtered_roles = new_roles.select { |r| ROLE_KINDS.include?(r) }
        update(roles: filtered_roles)
    end
    
    def remove_role(role)
        filtered_roles = roles.reject { |r| r == role }
        update(roles: filtered_roles)
    end

    def student?
        roles.include?('student')
    end
    
    def teacher?
        roles.include?('teacher')
    end

    def custodian?
        roles.include?('custodian')
    end

    def administrator?
        roles.include?('administrator')
    end

    def multirole?
        roles.size > 1
    end

    def full_name
        "#{first_name} #{last_name}"
    end
end
