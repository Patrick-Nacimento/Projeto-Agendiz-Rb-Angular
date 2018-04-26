module Concerns::ByName
  extend ActiveSupport::Concern

  included do
    scope :by_name, -> (name) {where("lower_unaccent(#{table_name}.name) LIKE :name", name: "%#{I18n.transliterate(name.downcase)}%")}
  end
end