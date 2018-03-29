<%
	Response.Buffer  = true
	Response.Expires = 0
	Session.lcId     = 1033
%>
<!-- #include file="includes/conexao.asp" -->
<%



id           	= Request.Form("id")         'ID da empresa
id_usuario   	= Request.Form("id_usuario") 'ID do usuário
avaliacao    	= 0 						 'ID do status de Analise
valor_avaliacao = 5							 'Valor da avaliação
valor           = Request.Form("valor")		 'Valor cobrado pela empresa no momento da solicitação

'Response.Write(Request.Form)
'Response.End


	strSQL = "insert into transacao (id_usuario,id_empresa,avaliacao,valor_avaliacao,valor_empresa) values ('"&id_usuario&"','"&id&"','"&avaliacao&"','"&valor_avaliacao&"','"&valor&"');"
	conDB.execute(strSQL)
	response.redirect("solicitacoes.asp?strStatus=INC")
	response.End

%>