<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IniciarSesion.aspx.cs" Inherits="BuzonQuejas.IniciarSesion" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Iniciar Sesion</title>
    <link rel="shortcut icon" href="Recursos/Imagenes/favicon.ico" />
    <%-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" />
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"></script>
     <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>--%>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet"/>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
     <link href="Recursos/Css/Estilos.css" rel="stylesheet" />
</head>
<body >
     <form id="formulario_index" class="form-control" runat="server">
        <div>
            <%--<asp:Label ID="lblBienvenida" runat="server" Text="" CssClass="h3"></asp:Label>--%>
        </div>
    <div class="container contact">
	<div class="row">
		<div class="col-md-3">
			<div class="contact-info">
				<img style="width:100px; height:100px;" src="Recursos/Imagenes/usuario.png" alt="image"/>
				<h2>Iniciar Sesión</h2>
                <h4>¡ Bienvenido colaborador Concentra !, a este tu espacio de opinión</h4>
				<%--<h4>!Tu queja es totalmente anónima!, no se registrará tu número de usuario ni tu Ip</h4>--%>
			</div>
		</div>
		<div class="col-md-9">
			<img src="Recursos/Imagenes/logoconcentra.png" alt="image"/>
			<div class="contact-form">
				<div class="form-group">
				  <label class="control-label col-sm-2" for="fname">Usuario:</label>
				  <div class="col-sm-10">          
					
					<asp:TextBox ID="tbUsuario" CssClass="form-control" runat="server" placeholder="Usuario" Text="Anonimo"></asp:TextBox>
				  </div>
				</div>
                <div class="form-group">
				  <label class="control-label col-sm-2" for="fname">Contraseña:</label>
				  <div class="col-sm-10">          
					
					<asp:TextBox ID="tbPassword" CssClass="form-control" runat="server" TextMode="Password" placeholder="Contraseña" value="Concentra2022"></asp:TextBox>
				  </div>
				</div>
			        <div class="row">
                        <asp:Label runat="server" CssClass="alert-danger" ID="lblError"></asp:Label>
                    </div>
                <br />
				
				<div class="form-group">        
				  <div class="col-sm-offset-2 col-sm-10">
					  <asp:Button ID="Button1" CssClass="btn btn-dark" runat="server" Text="Ingresar" OnClick="BtnIngresar_Click" />
					  
				  </div>
				
					
				  
				</div>
			</div>
		</div>
	</div>
</div>
	
       
    </form>

<!--FFFFF-->
  <%--  <div class="wrapper">
        <div class="formcontent">--%>
 <%--           <form id="formulario_login" runat="server" class="form-control">
              <div class="container contact">
                  <div class="col-md-9">
	          <div class="row">
                <div class="form-control">
                    <img src="Recursos/Imagenes/logoconcentra.png" alt="image"/>
                   <%-- <div class="row">
                        <asp:Label class="h2" ID="Bienvenida" runat="server" Text="Bienvenido" ></asp:Label>
                     </div>--%>
  <%--                   <div>
                        <asp:Label ID="lblUsuario" runat="server" Text="Usuario:"></asp:Label>
                        <asp:TextBox ID="tbUsuario" CssClass="form-control" runat="server" placeholder="Nombre de Usuario" Text="Anonimo"></asp:TextBox>
                    </div>
                    <div>
                        <asp:Label ID="lblPassword" runat="server" Text="Password:"></asp:Label>
                        <asp:TextBox ID="tbPassword" CssClass="form-control" Text="Concentra2022" TextMode="Password" runat="server" placeholder="Password" ></asp:TextBox>
                    </div>
                    <hr />
                    <div class="row">
                        <asp:Label runat="server" CssClass="alert-danger" ID="lblError"></asp:Label>
                    </div>
                    <br />
                    <div class="row">
                        <asp:Button ID="BtnIngresar" CssClass="btn btn-primary btn-dark" runat="server" Text="Ingresar" OnClick="BtnIngresar_Click" />
                    </div>
                </div>
                </div>
                </div>
            </form>--%>
    <%--    </div>
    </div>--%>
   <%-- <div class="footer">
    </div>--%>
</body>
</html>
