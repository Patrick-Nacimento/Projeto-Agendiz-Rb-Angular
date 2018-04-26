require_dependency APIAuth::Engine.root.join('app', 'models', 'user').to_s

Rails.application.config.to_prepare do
  ::User.class_eval do

    #Soft delete
    acts_as_paranoid

    #Concerns

    #Enumerate

    #Associations

    #Scopes
    scope :all_fields, -> {
      select("#{self.table_name}.*")
    }
    scope :current_customer, -> do
      #   if User.current_user
      #     if Customer::Customer.current_customer && !::User.current_user.admin?
      #       joins("JOIN #{Customer::UserCustomer.table_name} x ON x.user_id = #{self.table_name}.id")
      #     end
      #   end
    end
    # default_scope {current_customer}

    #Callbacks

    #Validations

    def generate_password_recover
      token = self.set_reset_password_token

      ::Mailer.reset_password(self, token).deliver_later

      token
    end

    private

  end
end

