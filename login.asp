<%
	Response.Buffer  = true
	Response.Expires = 0
	Session.lcId     = 1033
%>
<!-- #include file="includes/conexao.asp" -->

<%


email      = Request.Form("email")
senha      = Request.Form("senha")


	strSQL = "SELECT * FROM usuario WHERE email='"&email&"' AND senha='"&senha&"'"
	set ObjRst = conDB.execute(strSQL)
	
	'Verifica o retorno da consulta
	if ObjRst.EOF then
		login = false
	else
		login = true
	end if


	if login = true then

		Session("nome")         = ObjRst("nome") 	     'Grava na Sessão o nome do usuário
		Session("tipo_usuario") = ObjRst("tipo_usuario") 'Grava na Sessão o tipo de usuário
		Session("id_usuario")   = ObjRst("id_usuario")   'Grava na Sessão o id do usuário
		Session("logado")       = true 					 'Grava na Sessão o usuário logado como true, impedindo que acesse a página sem efetuar o login
		
		Response.redirect("dashboard.asp")
	else
		Response.redirect("index.asp?login=ERRO")
	end if
	




%>