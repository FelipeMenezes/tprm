<%

  If NOT Session("logado") = true Then
    Response.redirect("index.asp")
    Response.End
  End If

  Response.Buffer  = true
  Response.Expires = 0
  Session.lcId     = 1033
%>

<!-- #include file="includes/conexao.asp" -->

<%
  strStatus = Request.Item("strStatus")
  strMsg = ""
  select case trim(ucase(strStatus))
    case "ANA"
      strMsg = "Solicitação em Analise"
    case "REPRO"
      strMsg = "Solicitação Reprovada"
    case "APRO"
      strMsg = "Solicitação Aprovada"
    case else
      strMsg = ""
  end select
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>TPRM | Analise de Solicitações</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.7 -->  
  <link rel="stylesheet" href="bower_components/bootstrap/dist/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="bower_components/font-awesome/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="bower_components/Ionicons/css/ionicons.min.css">

  <!-- DataTables -->
  <link rel="stylesheet" href="bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css">

  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">
  <!-- Morris chart -->
  <link rel="stylesheet" href="bower_components/morris.js/morris.css">
  <!-- jvectormap -->
  <link rel="stylesheet" href="bower_components/jvectormap/jquery-jvectormap.css">
  <!-- Date Picker -->
  <link rel="stylesheet" href="bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">
  <!-- Daterange picker -->
  <link rel="stylesheet" href="bower_components/bootstrap-daterangepicker/daterangepicker.css">
  <!-- bootstrap wysihtml5 - text editor -->
  <link rel="stylesheet" href="plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

  <!-- Google Font -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <header class="main-header">
    <!-- Logo -->
    <a href="dashboard.asp" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini"><b>T</b>M</span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg"><b>TPRM</b></span>
    </a>
    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
        <span class="sr-only">Toggle navigation</span>
      </a>
      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
          <li class="dropdown user user-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <span class="hidden-xs"><%=Session("nome")%></span>
            </a>
            <ul class="dropdown-menu">
              <!-- Menu Body -->
              <li class="user-body">
                <!-- /.row -->
              </li>
              <!-- Menu Footer-->
              <li class="user-footer">
                <div class="pull-right">
                  <a href="logout.asp" class="btn btn-default btn-flat">Logout</a>
                </div>
              </li>
            </ul>
          </li>
          <!-- Control Sidebar Toggle Button -->

        </ul>
      </div>
    </nav>
  </header>
  <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <ul class="sidebar-menu" data-widget="tree">
        <li class="header">Menu</li>
          
        <%
          if Session("tipo_usuario") = 3 then 
        %>

        <li class="treeview">
          <a href="#">
            <i class="fa fa-tag"></i> <span>Empresas/Seviços</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="servico.asp"><i class="fa fa-circle-o"></i> Serviços</a></li>
            <li class="active"><a href="empresa.asp"><i class="fa fa-circle-o"></i> Empresas</a></li>
          </ul>
        </li>

        <li class="treeview">
          <a href="#">
            <i class="fa fa-tag"></i> <span>Usuário</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="usuario.asp"><i class="fa fa-circle-o"></i> Usuário</a></li>
          </ul>
        </li>

        <%
          end if
        %>

        <%
          if Session("tipo_usuario") = 3 OR Session("tipo_usuario") = 1 then 
        %>

        <li class="treeview">
          <a href="#">
            <i class="fa fa-tag"></i> <span>Solicitação de Serviço</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="solicitar.asp"><i class="fa fa-circle-o"></i> Solicitar</a></li>
            <li><a href="solicitacoes.asp"><i class="fa fa-circle-o"></i> Solicitações</a></li>
          </ul>
        </li>

        <%
          end if
        %>

        <%
          if Session("tipo_usuario") = 3 OR Session("tipo_usuario") = 2 then 
        %>

        <li class="treeview">
          <a href="#">
            <i class="fa fa-tag"></i> <span>Analise de Solicitações</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="analise.asp"><i class="fa fa-circle-o"></i> Analise</a></li>
          </ul>
        </li>

        <%
          end if        
        %>

        <%
          if Session("tipo_usuario") = 3 then 
        %>

        <li class="active treeview">
          <a href="#">
            <i class="fa fa-tag"></i> <span>Analise Financeira</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="analise_financeira.asp"><i class="fa fa-circle-o"></i> Analise</a></li>
          </ul>
        </li>

        <%
          end if        
        %>
        
      </ul>
    </section>
    <!-- /.sidebar -->
  </aside>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Analise de Solicitações
        <small>Painel</small>
      </h1>
    </section>

    <!-- Main content -->
    <section class="content">
      <!-- Small boxes (Stat box) -->

      <% if trim(strMsg) <> "" then %>
          <div class="alert alert-success">
            <a href="#" class="close" data-dismiss="alert" aria-label="close" title="close">×</a>
            <%=strMsg%>      
          </div>
      <% end if %>

      <div class="box">
      <!-- Aqui fica o conteudo -->
        <div class="box-body">
          <table id="table_empresa" class="table table-bordered table-hover">
            <thead>
            <tr>
              <th>Empresa</th>
              <th>Valor Total de Serviço(R$)</th>
              <th>Valor Total de Taxa(R$)</th>
              <th>Total(R$)</th>
            </tr>
            </thead>
            <tbody>
            <%
              strSQL = "SELECT empresa.id_empresa,empresa.empresa,SUM(transacao.valor_empresa) AS valor_total_empresa,SUM(transacao.valor_avaliacao) AS valor_total_transacao,SUM(transacao.valor_empresa + transacao.valor_avaliacao) AS Total FROM transacao INNER JOIN usuario ON usuario.id_usuario = transacao.id_usuario INNER JOIN empresa ON empresa.id_empresa = transacao.id_empresa INNER JOIN servico ON servico.id_servico = empresa.id_servico group by empresa.empresa,empresa.id_empresa,transacao.valor_empresa,transacao.valor_avaliacao"
              set ObjRst = conDB.execute(strSQL)
              do while not ObjRst.EOF
            %>
            <tr>
              <td><%=ObjRst("empresa")%></td>
              <td><%=FormatCurrency(ObjRst("valor_total_empresa"),2)%></td>
              <td><%=FormatCurrency(ObjRst("valor_total_transacao"),2)%></td>
              <td><%=FormatCurrency(ObjRst("total"),2)%></td>
            </tr>
          <%
            ObjRst.MoveNext()
            loop
            set ObjRst = Nothing
          %>
            </tfoot>
          </table>
        </div>
      </div>


      </div>

    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  <footer class="main-footer">
    <div class="pull-right hidden-xs">
    </div>
    <strong>2018 - TPRM</strong>
  </footer>

  <!-- Control Sidebar -->

  <!-- /.control-sidebar -->
  <!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
  <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->

<!-- jQuery 3 -->
<script src="bower_components/jquery/dist/jquery.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="bower_components/jquery-ui/jquery-ui.min.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
  $.widget.bridge('uibutton', $.ui.button);
</script>
<!-- Bootstrap 3.3.7 -->
<script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- Morris.js charts -->
<script src="bower_components/raphael/raphael.min.js"></script>
<script src="bower_components/morris.js/morris.min.js"></script>
<!-- Sparkline -->
<script src="bower_components/jquery-sparkline/dist/jquery.sparkline.min.js"></script>
<!-- jvectormap -->
<script src="plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script src="plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<!-- jQuery Knob Chart -->
<script src="bower_components/jquery-knob/dist/jquery.knob.min.js"></script>
<!-- daterangepicker -->
<script src="bower_components/moment/min/moment.min.js"></script>
<script src="bower_components/bootstrap-daterangepicker/daterangepicker.js"></script>
<!-- datepicker -->
<script src="bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
<!-- Bootstrap WYSIHTML5 -->
<script src="plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
<!-- Slimscroll -->
<script src="bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<!-- DataTables -->
<script src="bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
<!-- FastClick -->
<script src="bower_components/fastclick/lib/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/adminlte.min.js"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="dist/js/pages/dashboard.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="dist/js/demo.js"></script>

<script>
  $(function () {
    $('#table_empresa').DataTable({
      'paging'      : true,
      'lengthChange': false,
      'searching'   : false,
      'ordering'    : true,
      'info'        : true,
      'autoWidth'   : false,
        'oLanguage': {
                    'sProcessing':   'Processando...',
                    'sLengthMenu':   'Mostrar _MENU_ registros',
                    'sZeroRecords':  'Não foram encontrados resultados',
                    'sInfo':         'Mostrando de _START_ até _END_ de _TOTAL_ registros',
                    'sInfoEmpty':    'Mostrando de 0 até 0 de 0 registros',
                    'sInfoFiltered': '',
                    'sInfoPostFix':  '',
                    'sSearch':       'Buscar:',
                    'sUrl':          '',
                    'oPaginate': {
                        'sFirst':    'Primeiro',
                        'sPrevious': 'Anterior',
                        'sNext':     'Seguinte',
                        'sLast':     'Último'
                    }
        }
    })
  })
</script>

</body>
</html>
