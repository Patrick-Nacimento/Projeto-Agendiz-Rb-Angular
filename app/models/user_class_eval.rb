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

    def can_authenticate?(integration)
      case integration[:auth_key]
        when 'af4fa63eafb0fd536852' #painel
          if !self.admin? && !self.is_admin
            return false
          end
        when 'b02735942b8bd9e51350' #IOS
          if self.admin? || self.is_admin
            return false
          end
        when '14ddf8f2df09d5d7fc6a' #Android
          if self.admin? || self.is_admin
            return false
          end
        else
          return false
      end

      return true
    end

    private

  end
end

