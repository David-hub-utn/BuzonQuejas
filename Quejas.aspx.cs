using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BuzonQuejas
{
    public partial class Quejas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
       

        protected void EntityDataSource1_Selecting(object sender, EntityDataSourceSelectingEventArgs e)
        {

        }

     
        public override void VerifyRenderingInServerForm(Control control)
        {

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            BuzonQuejas.SelectCommand = "SELECT * FROM [Quejas] WHERE  Usuario like '%" + TextBox1.Text + "%'";
            BuzonQuejas.DataBind();
        }
    }
}