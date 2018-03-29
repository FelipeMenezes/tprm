<% @ LANGUAGE="VBSCRIPT" %>
<!-- #include file="includes/conexao.asp" -->
<%
	id = Request.QueryString ("id")
	if trim(id) = "" or isnull(id) or trim(id) = "0" then
		Response.Write ("<script>alert('Usuário não informado. Favor verificar!'); document.location='usuario.asp';</script>")
		Response.End
	end If
	strSQL = "delete from usuario where id_usuario = " & id
	conDB.execute(strSQL)
	Response.Redirect ("usuario.asp?strStatus=EXC")
	Response.End
%>