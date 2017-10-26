using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class Pastorders : System.Web.UI.Page
{
	static string cons;

    static Pastorders()
    {
        cons = WebConfigurationManager.ConnectionStrings["constring"].ConnectionString;
    }

    protected void Page_Load(object sender, EventArgs e)
    {
    	if(!IsPostBack)
    	{
    		SqlConnection con = new SqlConnection(cons);
    		con.Open();
    		SqlCommand com = new SqlCommand("SELECT * FROM Orders where Source='"+Session["Location"]+"'", con);
    		DataSet ds = new DataSet();
			SqlDataAdapter adapter = new SqlDataAdapter(com);
			adapter.Fill(ds);
			pogrid.DataSource = ds.Tables[0];
			pogrid.DataBind();

    	}
    }

    protected void OnPaging(object sender, GridViewPageEventArgs e)
    {
        pogrid.PageIndex = e.NewPageIndex;
        pogrid.DataBind();
    }

    protected void ViewClick_Redirect(object sender, EventArgs e)
    {
        string Id = (sender as LinkButton).CommandArgument;
        Response.Redirect("ViewOrderDetails.aspx?Id=" + Id);
    }
}