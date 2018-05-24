# Configurações para criar novo projeto
## Gitlab
* Criar um grupo internal com o nome da empresa se ainda não existir
* Criar um projeto internal dentro desse grupo

## Versões no project_base
* Ruby version 2.4.4
* Ruby version 5.2.0
* API Base branch url_auth_key
* API Auth branch url_auth_key
* Angular branch new_design

## Configurações prontas
* Configurações de testes
* Configurações de ambiente (Rever se mudar a versão do Rails)
* Login
* Recuperar senha
* Gems padrões

## Configurar na maquina/terminal
* git clone git@gitlab.velow.com.br:modules/rails_base.git
* Entrar no projeto
* Executar o comando "rails g rename:into Nome-do-novo-projeto"
* Sair do rails_base e entrar no novo projeto

## Configurar Angular
* Ajustar nome do projeto e cores em assets/javascripts/application.js

## Configurações no novo projeto
* Database create/migrate
* Rails test para ver ser deu certo
* Revisar versões das Gems
* Alterar texto do e-mail de recuperação de senha

## Configurar novo projeto com o gitlab
* git config --global user.name "seu-ome"
* git config --global user.email "seu-email"
* git remote set-url origin endereco-do-projeto-no-git
* git commit -m "Initial commit"
* git push -u origin master

