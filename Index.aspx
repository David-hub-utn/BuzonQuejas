<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="BuzonQuejas.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Buzón de Quejas</title>
	<link rel="shortcut icon" href="Recursos/Imagenes/favicon.ico" />
	<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet"/>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>

   <%-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"></script>--%>
  <%--  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>--%>


    <link href="Recursos/Css/Estilos.css" rel="stylesheet" />
</head>
<body>
    <form id="formulario_index" class="form-control" runat="server">
        <div>
            <asp:Label ID="lblBienvenida" runat="server" Text="" CssClass="h3"></asp:Label>
        </div>
    <div class="container contact">
	<div class="row">
		<div class="col-md-3">
			<div class="contact-info">
				<img src="https://image.ibb.co/kUASdV/contact-image.png" alt="image"/>
				<h2>Buzón de Quejas</h2>
				<h4>!Tu queja es totalmente anónima!, no se registrará tu número de usuario ni tu Ip</h4>
			</div>
		</div>
		<div class="col-md-9">
			<img src="Recursos/Imagenes/logoconcentra.png" alt="image"/>
			<div class="contact-form">
				<div class="form-group">
				  <label class="control-label col-sm-2" for="fname">Nombre:</label>
				  <div class="col-sm-10">          
					
					<asp:TextBox ID="Nombre" CssClass="form-control" runat="server" placeholder="Puedes dejar este campo en blanco:" ></asp:TextBox>
				  </div>
				</div>
				<div class="form-group">
				  <label class="control-label col-sm-2" for="fname">Site:</label>
				  <div class="col-sm-10">          
					
				 <asp:DropDownList id="Site" runat="server" CssClass="form-control">

                  <asp:ListItem Selected="True" Value="Tlalpan"> Tlalpan </asp:ListItem>
                  <asp:ListItem Value="ParqueLira"> Parque Lira </asp:ListItem>
                  <asp:ListItem Value="Monterrey"> Monterrey </asp:ListItem>
                  <asp:ListItem Value="Queretaro"> Queretaro </asp:ListItem>
                  

               </asp:DropDownList>
				  </div>
				</div>
			
				<div class="form-group">
				  <label class="control-label col-sm-2" for="comment">Queja:</label>
				  <div class="col-sm-10">
					<asp:TextBox runat="server" TextMode="MultiLine" class="form-control" placeholder="Máximo 500 Caracteres . . ." rows="5" id="Queja"></asp:TextBox>
					  <%--<textarea runat="server" class="form-control" rows="5" id="Queja"></textarea>--%>
				  </div>
				  Caracteres: <span id="numerocaracteres">0</span>
				</div>
				<div class="form-group">        
				  <div class="col-sm-offset-2 col-sm-10">
					
					  <asp:Button ID="BtnCerrar" runat="server" Text="Cerrar Sesión" CssClass="btn btn-dark" OnClick = "BtnCerrar_Click"/>
					   <asp:Button ID="Consultar" CssClass="btn btn-info" runat="server" Text="Consultar Quejas" OnClick = "Consultar_Quejas" />
					  <asp:Button ID="EnviarQueja" CssClass="btn btn-success" runat="server" Text="Enviar" OnClick = "Enviar" />

					

				  </div>
				
				   
				  
				</div>
			</div>
		</div>
	</div>
</div>
	
       
    </form>
</body>
<script type="text/javascript" language="javascript">
 
//--------------------
   
	$(document).ready(function () {
		let prevUrl = document.referrer;
        if (prevUrl == 'http://192.168.254.36:89/IniciarSesion.aspx') {
            swal('¡ Importante !', 'Para dar seguimiento personal a la queja, deberás apuntar el número de folio que se mostrará después de dar click en enviar, y mandarlo junto con tus datos al correo: buzon.comentarios@grupoconcentra.com.mx', 'warning');
        }
		contador("#Queja","#numerocaracteres");
        function contador(idtextarea, idcontador) {

            function update_contador(idtextarea, idcontador) {

                var contador = $(idcontador);
                var ta = $(idtextarea);
                contador.css("color", "#469c2d");

                contador.html(ta.val().length);
                if (ta.val().length < 5) {
                    $("#EnviarQueja").prop('disabled', true);
                    contador.css("color", "black");
                }
                else if (ta.val().length > 4 && ta.val().length <= 350) {
                    $("#EnviarQueja").prop('disabled', false);
                    contador.css("color", "#469c2d");
                }
                else if (ta.val().length > 350 && ta.val().length < 450) {
                    $("#EnviarQueja").prop('disabled', false);
                    contador.css("color", "#ffae00");
                }
                else if (ta.val().length >= 450 && ta.val().length <= 500) {
                    $("#EnviarQueja").prop('disabled', false);
                    contador.css("color", "#d1111c");
                }
                else if (ta.val().length > 500) {
                    contador.css("color", "#d1111c");
                    $("#EnviarQueja").prop('disabled', true);
                    swal('¡ Número de caracteres superados !', 'El número máximo de caracteres permitidos es 500', 'warning');

                }

            }

            $(idtextarea).keyup(function () {
                update_contador(idtextarea, idcontador);
            });

            $(idtextarea).change(function () {
                update_contador(idtextarea, idcontador);
            });

        }
	
		

	});
    
</script>
</html>
