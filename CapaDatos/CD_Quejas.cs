using CapaDatos;
using CapaModelo;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaDatos
{
    public class CD_Quejas
    {
        public static CD_Quejas _instancia = null;

        private CD_Quejas()
        {

        }

        public static CD_Quejas Instancia
        {
            get
            {
                if (_instancia == null)
                {
                    _instancia = new CD_Quejas();
                }
                return _instancia;
            }
        }

        

        public DataTable ReporteQuejas()
        {
            DataTable dt = new DataTable();

            using (SqlConnection oConexion = new SqlConnection(Conexion.CN))
            {
                SqlCommand cmd = new SqlCommand("ObtenerQuejas", oConexion)
                {
                    // cmd.Parameters.AddWithValue("@IdTienda", IdTienda);
                    // cmd.Parameters.AddWithValue("@Codigo", CodigoProducto);
                    //cmd.Parameters.AddWithValue("@tabla", tabla);
                    CommandType = CommandType.StoredProcedure
                };

                try
                {
                    oConexion.Open();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(dt);
                    return dt;

                }
                catch (Exception ex)
                {
                    dt = null;
                    return dt;
                }
            }
        }

     
    }
}
