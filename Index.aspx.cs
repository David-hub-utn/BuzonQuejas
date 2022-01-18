using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace BuzonQuejas
{
    public partial class Index : System.Web.UI.Page
    {
       
        string usuariologueado;
       

        [Obsolete]
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usuariologueado"] != null)
            {
                usuariologueado = Session["usuariologueado"].ToString();
                // lblBienvenida.Text = "Bienvenido/a " + usuariologueado;
                if (usuariologueado == "Angelica")
                {
                    
                    Consultar.Visible = true;
                }
                else
                {
                    Consultar.Visible = false;

                }

            }
            else
            {
                Response.Redirect("IniciarSesion.aspx");
            }
        }
        
        protected void BtnCerrar_Click(object sender, EventArgs e)
        {
       
            Session.Remove("usuariologueado");
            Response.Redirect("IniciarSesion.aspx");
        }

        protected void Consultar_Quejas(object sender, EventArgs e)
        {
            if (usuariologueado == "Angelica")
            {
                Response.Redirect("QuejasBuzon.aspx");
            }
            else
            {
                Response.Redirect("IniciarSesion.aspx");
            }

        }

        [Obsolete]
        protected void Enviar(object sender, EventArgs e)
        {


            try
            {

                //string Nom = Nombre.Text;
                
                string Nom = Nombre.Text == "" ? "Anónimo" : Nombre.Text;
                string Centro = Site.SelectedValue;
                string Comentario = Queja.Text;
                
                string respuesta;

        string conectar = ConfigurationManager.ConnectionStrings["conexion"].ConnectionString;
                SqlConnection sqlConectar = new SqlConnection(conectar);
                SqlCommand cmd = new SqlCommand("SP_RegistrarQueja", sqlConectar)
                {
                    CommandType = CommandType.StoredProcedure
                };
                cmd.Connection.Open();
                cmd.Parameters.Add("@Usuario", SqlDbType.VarChar, 50).Value = Nom;
                cmd.Parameters.Add("@Site", SqlDbType.VarChar, 20).Value = Centro;
                cmd.Parameters.Add("@Queja", SqlDbType.VarChar, 500).Value = Comentario;
                cmd.Parameters.Add("@Resultado", SqlDbType.VarChar, 100).Direction = ParameterDirection.Output;
                SqlDataReader dr = cmd.ExecuteReader();
                //cmd.ExecuteNonQuery();

                respuesta = Convert.ToString(cmd.Parameters["@Resultado"].Value);

                cmd.Connection.Close();

               
                string script_success = @"<script type='text/javascript'>
                                $(document).ready(function () {
                                  $('#Nombre').val('');
                                  $('#Queja').val('');

                                var titulo = 'Tu número de folio es : "+respuesta+ @"';
                                var mensaje = 'Agradecemos tu confianza y te invitamos a que te acerques al área de Desarrollo Humano de tu centro, estamos para apoyarte.'
                                    swal(titulo,mensaje,'success');
                                });
                                
                                
                            </script>";
                Page.RegisterStartupScript("swal", script_success);
            }
            catch
            {
                string script_error = @"<script type='text/javascript'>
                            swal('Error','No se pudo enviar la queja','error');</script>";
                Page.RegisterStartupScript("swal", script_error);

            }

      

        }
    }
}