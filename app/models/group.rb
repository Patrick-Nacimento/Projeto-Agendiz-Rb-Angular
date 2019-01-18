class Group < ApplicationRecord
    has_many :interns
    belongs_to :recruiter

    validates :area, presence: true

    validates :recruiter, presence: true
end
