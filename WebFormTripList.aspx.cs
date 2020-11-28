using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Lab_3
{
    public partial class WebFormTripList : System.Web.UI.Page
    {
        ServiceReference1.WebService1SoapClient service = new ServiceReference1.WebService1SoapClient();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                GridView1.DataSource = service.GetData(null, null);
                GridView1.DataBind();
            }
        }

        protected void GetData_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(dateFrom.Text) && !string.IsNullOrEmpty(dateTo.Text) && DateTime.Parse(dateFrom.Text) < DateTime.Parse(dateTo.Text))
            {
                GridView1.DataSource = service.GetData(dateFrom.Text, dateTo.Text);
                GridView1.DataBind();
            }
            else
            {
                Page_Load(null, null);
            }
        }

        protected void Delete_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow row in GridView1.Rows)
            {
                CheckBox cb = (CheckBox)row.FindControl("CheckBox1");
                if (cb != null && cb.Checked)
                {
                    var id = cb.Attributes["data-value"].ToString();
                    service.Delete(id);
                }
            }

            Response.Redirect("/WebFormTripList.aspx");
        }

        protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        {

        }
    }
}