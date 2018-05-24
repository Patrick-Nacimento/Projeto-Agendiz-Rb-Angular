if ::User.by_email('admin@velow.com.br').blank?
  user = ::User.new({name: 'Admin', email: 'admin@velow.com.br', password: 'Senha123', password_confirmation: 'Senha123'})
  user.save!
end
