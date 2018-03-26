<% 
	
	' O link abaixo list os "strDriver" existentes.
	' https://pt.stackoverflow.com/questions/13052/string-de-conex%C3%A3o-sql-server-para-asp-cl%C3%A1ssico
	strDriver = "SQLNCLI10"
	strServer = "DEF-PC\SQLEXPRESS"
	strUser   = "sa"
	strPass   = "felipe"
	strDB     = "db_tprm"

	

	' Cria uma nova instância da Classe formando o Objeto
	Set conDB = Server.CreateObject ("ADODB.Connection")
	'strConexaoDB = "driver={"&strDriver&"};server="&strServer&";uid="&strUser&";pwd="&strPass&";database=" & strDB
	strConexaoDB = "Provider="&strDriver&";Server="&strServer&";Uid="&strUser&";Pwd="&strPass&";Database=" & strDB
	Session("connectionstring")	=	strConexaoDB
	' Abre a conexão com o Banco de dados
	conDB.ConnectionString = Session("connectionstring")

	conDB.Open

%>