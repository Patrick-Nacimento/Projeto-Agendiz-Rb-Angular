module Concerns::ChangedBy
  extend ActiveSupport::Concern

  included do
    #Relations
    belongs_to :created_by, class_name: '::User', required: false
    belongs_to :updated_by, class_name: '::User', required: false

    #Callbacks
    before_save :set_updated_by
    before_create :set_created_by

    def set_created_by
      self.created_by = User.current_user if User.current_user
    end

    def set_updated_by
      self.updated_by = User.current_user if User.current_user
    end
  end
end