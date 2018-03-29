<% @ LANGUAGE="VBSCRIPT" %>
<!-- #include file="includes/conexao.asp" -->
<%
	id = Request.QueryString ("id")
	if trim(id) = "" or isnull(id) or trim(id) = "0" then
		Response.Write ("<script>alert('Analise não informada. Favor verificar!'); document.location='analise.asp';</script>")
		Response.End
	end If
	


	
	strSQL = "update transacao set avaliacao = 2 where id_transacao = " & id

	conDB.execute(strSQL)
	Response.Redirect ("analise.asp?strStatus=APRO")
	Response.End
%>