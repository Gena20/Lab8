using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Lab_3
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //string path = @"Data Source = DESKTOP - VGGCBP0; Initial Catalog = auto; Integrated Security = True";
            //string q = "SELECT * FROM cars";
            //DataSet dataSet = new DataSet();

            //using (SqlConnection con = new SqlConnection(path))
            //{
            //    SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(q, con);
            //    sqlDataAdapter.Fill(dataSet, "cars");
            //    GridView1.DataSource = dataSet.Tables["cars"];
            //    GridView1.DataBind();
            //}

        }
    }
}