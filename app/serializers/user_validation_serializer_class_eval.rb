#encoding: UTF-8
Rails.application.config.to_prepare do
  ::APIAuth::UserValidationSerializer.class_eval do
    attributes :name,
               :profile,
               :admin,
               :is_admin,
               :customer,
               :is_subsidiary

    def admin
      object.admin?
    end

    def root_user
      nil
    end

    def is_subsidiary
      object.customers.first.try(:parent).present?
    end

    def customer
      if object.respond_to? :customers and object.customers.any?
        customer = object.customers.first

        if customer
          {
              id: customer.id,
              name: customer.name
          }
        end
      end
    end

    def customers
      if object.respond_to? :customers and object.customers.any?
        object.customers.map do |customer|
          hash = {
              id: customer.id,
              name: customer.name,
              slug: customer.slug,
              primary_color: customer.primary_color,
              accent_color: customer.accent_color,
              primary_color_hexadecimal: customer.primary_color_hexadecimal,
              accent_color_hexadecimal: customer.accent_color_hexadecimal
          }

          if customer.logo
            hash[:logo] = {
                small: customer.logo.url(:small),
                medium: customer.logo.url(:medium),
                default: customer.logo.url,
            }
          end

          hash
        end
      end
    end
  end
end