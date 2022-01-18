using CapaDatos;
using CapaModelo;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BuzonQuejas
{
    public partial class QuejasBuzon : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usuariologueado"] != null)
            {
                string usuariologueado = Session["usuariologueado"].ToString();
                if (usuariologueado != "Angelica")
                {
                    Response.Redirect("IniciarSesion.aspx");
                }
              
                // lblBienvenida.Text = "Bienvenido/a " + usuariologueado;
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
        protected void Buzon(object sender, EventArgs e)
        {
            
                Response.Redirect("Index.aspx");
            

           


        }
        [WebMethod]
        public static Respuesta<string> Obtener()
        {
            DataTable dt = CD_Quejas.Instancia.ReporteQuejas();

            System.Web.Script.Serialization.JavaScriptSerializer serializer = new System.Web.Script.Serialization.JavaScriptSerializer();
            List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
            Dictionary<string, object> row;
            foreach (DataRow dr in dt.Rows)
            {
                row = new Dictionary<string, object>();
                foreach (DataColumn col in dt.Columns)
                {
                    row.Add(col.ColumnName, dr[col]);
                }
                rows.Add(row);
            }
            return new Respuesta<string>() { estado = true, objeto = serializer.Serialize(rows) };

        }
    }
}