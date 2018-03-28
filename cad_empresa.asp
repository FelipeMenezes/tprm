<%
	Response.Buffer  = true
	Response.Expires = 0
	Session.lcId     = 1033
%>
<!-- #include file="includes/conexao.asp" -->
<%



id        = Request.Form("id")


id_servico   = Request.Form("id_servico")
empresa      = Request.Form("empresa")
descricao    = Request.Form("descricao")
valor 	     = Request.Form("valor")

'Response.Write(valor)
'Response.End

if (trim(id) = "") or (isnull(id)) then id = 0 end if
	
if cint(id) = 0 then
	
	strSQL = "insert into empresa (id_servico,empresa,descricao,valor) values ('"&id_servico&"','"&empresa&"','"&descricao&"','"&valor&"');"
	conDB.execute(strSQL)
	response.redirect("empresa.asp?strStatus=INC")
	response.End
	
else
	strSQL = "update empresa set id_servico = '"&id_servico&"', empresa = '"&empresa&"', descricao = '"&descricao&"',valor = '"&valor&"' where id_empresa = " & id
	conDB.execute(strSQL)
	response.redirect("empresa.asp?strStatus=ALT")
	response.End
end if
%>