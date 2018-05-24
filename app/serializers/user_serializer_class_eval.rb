#encoding: UTF-8
Rails.application.config.to_prepare do
  ::UserSerializer.class_eval do
    attributes :email,
               :name

  end
end