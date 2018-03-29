<% @ LANGUAGE="VBSCRIPT" %>
<!-- #include file="includes/conexao.asp" -->
<%
	id = Request.QueryString ("id")
	if trim(id) = "" or isnull(id) or trim(id) = "0" then
		Response.Write ("<script>alert('Solicitação não informada. Favor verificar!'); document.location='solicitacoes.asp';</script>")
		Response.End
	end If
	strSQL = "delete from transacao where id_transacao = " & id
	conDB.execute(strSQL)
	Response.Redirect ("solicitacoes.asp?strStatus=EXC")
	Response.End
%>