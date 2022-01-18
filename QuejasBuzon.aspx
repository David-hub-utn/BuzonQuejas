<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QuejasBuzon.aspx.cs" Inherits="BuzonQuejas.QuejasBuzon" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Consulta Buzón de Quejas</title>
    <link rel="shortcut icon" href="Recursos/Imagenes/favicon.ico" />
       <style>
        .buttons-excel{
            color: #fff !important;
            background-color: #28a745 !important;
            border-color: #28a745 !important;
        }

        .buttons-pdf{
            color: #fff !important;
            background-color: #dc3545 !important;
            border-color: #dc3545 !important;
        }

        .buttons-print {
            color: #fff !important;
            background-color: #17a2b8 !important;
            border-color: #17a2b8 !important;
        }
    </style>
<%--    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
      <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet"/>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>--%>
<%--<script src="https://ajax.googleapis.com/ajax/libs/prototype/1.7.3.0/prototype.js"></script>--%>
     
   <link href="Assets/Plugins/bootstrap.4.5.2/bootstrap.min.css" rel="stylesheet" />
    <link href="Assets/Plugins/sweetalert2/sweetalert.css" rel="stylesheet" />
    <link href="Assets/Plugins/fontawesome-free-5.15.1-web/css/all.css" rel="stylesheet" />
    <link href="Assets/Plugins/bootstrap-icons-1.2.2/font/bootstrap-icons.css" rel="stylesheet" />
    <link href="Assets/Plugins/jquery-ui-1.12.1/jquery-ui.css" rel="stylesheet" />

    <link href="Assets/Plugins/datatables-buttons/css/buttons.dataTables.min.css" rel="stylesheet" />

    <script src="Assets/Plugins/jquery/jquery.3.5.1.min.js"></script>
    <script src="Assets/Plugins/bootstrap.4.5.2/bootstrap.min.js"></script>
    <script src="Assets/Plugins/sweetalert2/sweetalert.js"></script>
    <script src="Assets/Plugins/fontawesome-free-5.15.1-web/js/all.js"></script>

   
    <!-- STYLE DATATABLE -->
    <link href="Assets/Plugins/datatables/css/jquery.dataTables.min.css" rel="stylesheet" />
    <link href="Assets/Plugins/datatables/css/rowReorder.dataTables.min.css" rel="stylesheet" />
    <link href="Assets/Plugins/datatables/css/responsive.dataTables.min.css" rel="stylesheet" />
    <link href="Assets/Plugins/dataTables_checkboxes/css/dataTables.checkboxes.css" rel="stylesheet" />

    <!-- JS DATATABLE -->
    <script src="Assets/Plugins/datatables/js/jquery.dataTables.min.js"></script>
    <script src="Assets/Plugins/datatables/js/dataTables.rowReorder.min.js"></script>
    <script src="Assets/Plugins/datatables/js/dataTables.responsive.min.js"></script>
    <script src="Assets/Plugins/dataTables_checkboxes/js/dataTables.checkboxes.min.js"></script>


    <script src="Assets/Plugins/datatables-buttons/js/dataTables.buttons.min.js"></script>

    <script src="Assets/Plugins/datatables-buttons/js/buttons.flash.min.js"></script>
    <script src="Assets/Plugins/datatables-buttons/js/jszip.min.js"></script>
    <script src="Assets/Plugins/datatables-buttons/js/pdfmake.min.js"></script>
    <script src="Assets/Plugins/datatables-buttons/js/vfs_fonts.js"></script>
    <script src="Assets/Plugins/datatables-buttons/js/buttons.html5.min.js"></script>
    <script src="Assets/Plugins/datatables-buttons/js/buttons.print.min.js"></script>


    <script src="Assets/Plugins/jquery-ui-1.12.1/jquery-ui.js"></script>
     <script src="Assets/Plugins/loadingoverlay/loadingoverlay.js"></script>
     <script src="Recursos/Js/Quejas.js"></script>

</head>
<body>
    <form id="form1" runat="server" >
                 <div class="card-header">
                    Buzón de Quejas
                  </div>
        <br />
          <%--  <div class="row">--%>
            <div class="col-sm-12">
            <div class="card">
                            <div class="col-sm-2">
                                <div class="form-group mb-0">
                                   
                                </div>
                            </div>
                           <div class="row mt-3" id="alta">
                            <div class="col-sm-12">
                                <table id="tbReporte1" class="table table-striped table-bordered nowrap compact" style="width:100%">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Folio</th>
                                            <th>Usuario</th>
                                            <th>Site</th> 
                                            <th>Queja</th>                                             
                                            <th>Fecha</th>     
                                                  
                                        </tr>
                                    </thead>
                                    <tbody>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                </div>
                </div>
            <%--    </div>--%>
            
           <asp:Button ID="BtnCerrar" runat="server" Text="Cerrar Sesión" CssClass="btn btn-dark" OnClick = "BtnCerrar_Click"/>
      <asp:Button ID="Consultar" CssClass="btn btn-info" runat="server" Text="Buzón" OnClick = "Buzon" />
    </form>
  
</body>
</html>
