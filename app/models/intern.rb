class Intern < ApplicationRecord
    belongs_to :group

    validates :description, presence: true

    validates :age, presence: true

    validates :telephone, presence: true

    validates :quality, presence: true

    validates :defect, presence: true

    validates :group, presence: true
end


