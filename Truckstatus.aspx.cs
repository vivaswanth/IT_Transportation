using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class Truckstatus : System.Web.UI.Page
{
	static string cons;

    static Truckstatus()
    {
        cons = WebConfigurationManager.ConnectionStrings["constring"].ConnectionString;
    }

    protected void Page_Load(object sender, EventArgs e)
    {
    	if(!IsPostBack)
    	{
    		SqlConnection con = new SqlConnection(cons);
    		con.Open();
    		SqlCommand com = new SqlCommand("SELECT * FROM Trucks where OwnerID='"+Session["MID"]+"'", con);
    		DataSet ds = new DataSet();
			SqlDataAdapter adapter = new SqlDataAdapter(com);
			adapter.Fill(ds);
			ttgrid.DataSource = ds.Tables[0];
			ttgrid.DataBind();
    	}
    }

    protected void OnPaging(object sender, GridViewPageEventArgs e)
    {
        ttgrid.PageIndex = e.NewPageIndex;
        ttgrid.DataBind();
    }
}