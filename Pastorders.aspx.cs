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
    DataSet ds = new DataSet();   
    static Pastorders()
    {
        cons = WebConfigurationManager.ConnectionStrings["constring"].ConnectionString;
    }

    SqlConnection con = new SqlConnection(cons);
    protected void Page_Load(object sender, EventArgs e)
    {
    	if(!IsPostBack)
    	{
    		this.BindGrid();
    	}
    }

    public void BindGrid()
    {
        
        con.Open();
        SqlCommand com = new SqlCommand("SELECT * FROM Orders where Source='"+Session["Location"]+"' and OrderID NOT IN (SELECT OrderID from Tracking)", con);
        
        SqlDataAdapter adapter = new SqlDataAdapter(com);
        adapter.Fill(ds);
        pogrid.DataSource = ds.Tables[0];
        pogrid.DataBind();
    }

    protected void OnPaging(object sender, GridViewPageEventArgs e)
    {
        pogrid.PageIndex = e.NewPageIndex;
        BindGrid();
    }

    protected void ViewClick_Redirect(object sender, EventArgs e)
    {
        string Id = (sender as LinkButton).CommandArgument;
        Response.Redirect("ViewOrderDetails.aspx?Id=" + Id);
    }
}