class Role < ApplicationRecord
    KINDS = %w[
        student
        custodian
        teacher
        administrator
    ]

    validates :kind, inclusion: { in: KINDS}
end
