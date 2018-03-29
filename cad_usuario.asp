<%
	Response.Buffer  = true
	Response.Expires = 0
	Session.lcId     = 1033
%>
<!-- #include file="includes/conexao.asp" -->
<%


'Response.Write(Request.Form)
'Response.End

id        = Request.Form("id")

nome      	 = Request.Form("nome")
email        = Request.Form("email")
senha 	     = Request.Form("senha")
tipo_usuario = Request.Form("tipo_usuario")


if (trim(id) = "") or (isnull(id)) then id = 0 end if
	
if cint(id) = 0 then
	
	strSQL = "insert into usuario (nome,email,senha,tipo_usuario) values ('"&nome&"','"&email&"','"&senha&"','"&tipo_usuario&"');"
	conDB.execute(strSQL)
	response.redirect("usuario.asp?strStatus=INC")
	response.End
	
else
	strSQL = "update usuario set nome = '"&nome&"', email = '"&email&"',senha = '"&senha&"',tipo_usuario = '"&tipo_usuario&"' where id_usuario = " & id
	conDB.execute(strSQL)
	response.redirect("usuario.asp?strStatus=ALT")
	response.End
end if
%>