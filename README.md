# Configurações para criar novo projeto
## Gitlab
* Criar um grupo internal com o nome da empresa se ainda não existir
* Criar um projeto internal dentro desse grupo

## Versões no project_base
* Ruby version 2.5.1
* Ruby version 5.2.1
* API Base branch url_auth_key
* API Auth branch v2018
* Angular branch v2018

## Configurações prontas
* Configurações de testes
* Configurações de ambiente (Rever se mudar a versão do Rails)
* Login
* Recuperar senha
* Gems padrões
* Controle de integração

## Configurar na maquina/terminal
* git clone git@gitlab.velow.com.br:modules/project_base.git
* Entrar no projeto
* Executar o comando "rails g rename:into Nome-do-novo-projeto"
* Sair do project_base e entrar no novo projeto

## Configurar Angular
* Ajustar nome do projeto e cores em assets/javascripts/application.js

## Configurações no novo projeto
* Database create/migrate
* Rails test para ver ser deu certo
* Revisar versões das Gems
* Alterar texto do e-mail de recuperação de senha

## Configurar novo projeto com o gitlab
* git config --global user.name "seu-nome"
* git config --global user.email "seu-email"
* git remote set-url origin endereco-do-projeto-no-git
* git add .
* git commit -m "Initial commit"
* git push -u origin master

## Primeiro acesso
* Executar o comando rake db:seed
* Após o seed executado, deve ser aberto o console do rails (rails c)
* Executei o seguinte comando no console: "::Integration.where(name: 'Painel')" e copie a chave contida no atributo auth_key
* Após ter a chave, vá até o arquivo assets/javascripts/application.js
* Troque o conteúdo da tag authkey pela chave copiada.
* Após seguir os passo, será posssível fazer login no portal.

