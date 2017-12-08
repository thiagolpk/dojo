#language: pt
#utf-8

Funcionalidade: Cadastro de Usuario
Eu como Administrador
Quero logar no site
Para realizar o cadastro de um novo usuario e depois edita-lo

@teste1
Cenario: Cadastrar novo usuario

Dado que esteja logado no site orangehrm
Quando realizar o cadastro de um novo usuario
Entao é apresentado os detalhes pessoais do novo usuario

@teste2
Cenario: Editar novo usuario

Dado que esteja logado no site orangehrm
Quando alterar o nome do usuario
Entao é apresentado a mensagem de alteração realizada
