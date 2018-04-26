# Controllers
require Rails.root.join('app/controllers/api_auth/sessions_controller_class_eval')
require Rails.root.join('app/controllers/api/users_controller_class_eval')
# Models
require Rails.root.join('app/models/user_class_eval')
# Serializers
require Rails.root.join('app/serializers/user_serializer_class_eval')