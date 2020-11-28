using Antlr.Runtime.Misc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Lab_3
{
    public partial class WebFormAddTrip : System.Web.UI.Page
    {
        ServiceReference1.WebService1SoapClient service = new ServiceReference1.WebService1SoapClient();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                DropDownListCars.DataSource = service.GetSelectData("cars");
                DropDownListCars.DataTextField = "name";
                DropDownListCars.DataValueField = "id";
                DropDownListCars.DataBind();

                DropDownListObjects1.DataSource = service.GetSelectData("objects");
                DropDownListObjects1.DataTextField = "name";
                DropDownListObjects1.DataValueField = "id";
                DropDownListObjects1.DataBind();

                DropDownListObjects2.DataSource = service.GetSelectData("objects");
                DropDownListObjects2.DataTextField = "name";
                DropDownListObjects2.DataValueField = "id";
                DropDownListObjects2.DataBind();
            }

            DateLabel.Visible = false;
            ObjLabel.Visible = false;
        }

        protected void Add_Click(object sender, EventArgs e)
        {
            var car_id = DropDownListCars.SelectedValue;
            var obj_from_id = DropDownListObjects1.SelectedValue;
            var obj_to_id = DropDownListObjects2.SelectedValue;
            var date_from = dateFrom.Text;
            var date_to = dateTo.Text;

            if (!string.IsNullOrEmpty(date_from) && !string.IsNullOrEmpty(date_to) && DateTime.Parse(date_from) >= DateTime.Parse(date_to))
            {
                DateLabel.Visible = true;
            }
            if (obj_from_id == obj_to_id)
            {
                ObjLabel.Visible = true;
            }
            var res = service.Insert(car_id, obj_from_id, obj_to_id, date_from, date_to);

            if (res) Response.Redirect("/WebFormTripList.aspx");

        }
    }
}