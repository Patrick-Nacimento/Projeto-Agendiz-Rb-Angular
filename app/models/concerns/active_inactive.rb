module Concerns::ActiveInactive

  extend ActiveSupport::Concern

  included do
    scope :active, -> (active) {where(active: active)}
    before_validation :set_default_active_value, on: :create


    def destroy
      run_callbacks(:destroy) do
        update_columns(active: false, deleted_at: Time.now)
      end
    end

    def restore
      if self.valid?
        run_callbacks(:restore) do
          update_columns(active: true, deleted_at: nil)
        end
      else
        false
      end
    end

    private

    def set_default_active_value
      self.active = true if active.nil?
      true
    end

  end
end
