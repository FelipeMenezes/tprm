<% @ LANGUAGE="VBSCRIPT" %>
<!-- #include file="includes/conexao.asp" -->
<%
	id = Request.QueryString ("id")
	if trim(id) = "" or isnull(id) or trim(id) = "0" then
		Response.Write ("<script>alert('Empresa não informada. Favor verificar!'); document.location='empresa.asp';</script>")
		Response.End
	end If
	strSQL = "delete from empresa where id_empresa = " & id
	conDB.execute(strSQL)
	Response.Redirect ("empresa.asp?strStatus=EXC")
	Response.End
%>