# Configurações para criar novo projeto
## Gitlab
* Criar um grupo privado com o nome da empresa se ainda não existir
* Criar um projeto privado dentro desse grupo

## Versões no rails_base
* Ruby version 2.4.4
* Ruby version 5.2.0

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

## Configurações no novo projeto
* Database create/migrate
* Rails test para ver ser deu certo
* Revisar versões das Gems
* Alterar texto do e-mail de recuperação de senha

## Configurar novo projeto com o gitlab
* git config --global user.name "seu-ome"
* git config --global user.email "seu-email"
* git remote add origin endereco-do-projeto-no-git
* git commit -m "Initial commit"
* git push -u origin master

