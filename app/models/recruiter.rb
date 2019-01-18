class Recruiter < ApplicationRecord
    has_many :groups

    validates :description, presence: true

    validates :cnpj, presence: true

    validates :telephone, presence: true

end
