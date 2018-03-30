A configuração da conexão com a base de dados é necessário seguir os seguintes passos: 

No arquivo "conexao.asp", esta implementado a string de conexão.
As variáveis a seguir deve sem preenchidas conforme a configuração da máquina.

-> strDriver = deve informar o drive usado referente a versão do SqlServer.
-> strServer = deve informar em qual instância a base esta restaurada.
-> strUser = deve informar o usuário da base.
-> strPass = deve informar a senha da base.
-> strDB = deve informar o nome da base.

Segue abaixo o tipo de drive para cada versão de base a ser informado na variável "strDriver".
*SQL SERVER 2012: SQLNCLI11
*SQL SERVER 2008: SQLNCLI10
*SQL SERVER 2005: SQLNCLI
*SQL SERVER (Todos com acesso não nativo): sqloledb

Fonte: https://pt.stackoverflow.com/questions/13052/string-de-conex%C3%A3o-sql-server-para-asp-cl%C3%A1ssico

Usuário pré-cadastrados:

Administrador
Email: admin@gmail.com
Senha: 123

Usuário
Email: usuario@gmail.com
Senha: 123

Analista
Email: analista@gmail.com
Senha: 123

PS: Na pasta dump_db, contém a base SqlServer para ser restaurado na máquina que será configurado o projeto.
PS: O projeto foi desenvolvido usando a versão SqlServer 2008 R2