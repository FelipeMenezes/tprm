<%
	Response.Buffer  = true
	Response.Expires = 0
	Session.lcId     = 1033
%>
<!-- #include file="includes/conexao.asp" -->
<%



id   = Request.Form("id")
servico = Request.Form("servico")

if (trim(id) = "") or (isnull(id)) then id = 0 end if

	
if cint(id) = 0 then
	
	strSQL = "insert into servico (tipo_servico) values ('"&servico&"');"
	conDB.execute(strSQL)
	response.redirect("servico.asp?strStatus=INC")
	response.End
	
else
	strSQL = "update servico set tipo_servico = '"&servico&"' where id_servico = " & id
	conDB.execute(strSQL)
	response.redirect("servico.asp?strStatus=ALT")
	response.End
end if
%>