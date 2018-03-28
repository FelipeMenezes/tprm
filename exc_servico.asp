<% @ LANGUAGE="VBSCRIPT" %>
<!-- #include file="includes/conexao.asp" -->
<%
	id = Request.QueryString ("id")
	if trim(id) = "" or isnull(id) or trim(id) = "0" then
		Response.Write ("<script>alert('Serviço não informado. Favor verificar!'); document.location='servico.asp';</script>")
		Response.End
	end If
	strSQL = "delete from servico where id_servico = " & id
	conDB.execute(strSQL)
	Response.Redirect ("servico.asp?strStatus=EXC")
	Response.End
%>