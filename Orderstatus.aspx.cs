using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class Orderstatus : System.Web.UI.Page
{
    static string cons;

    static Orderstatus()
    {
        cons = WebConfigurationManager.ConnectionStrings["constring"].ConnectionString;
    }

    protected void Page_Load(object sender, EventArgs e)
    {
    	if(!IsPostBack)
    	{
    		SqlConnection con = new SqlConnection(cons);
    		con.Open();
    		SqlCommand com = new SqlCommand("SELECT * FROM Tracking where OwnerID=@oid", con);
    		com.Parameters.AddWithValue("@oid", Session["MID"]);
    		DataSet ds = new DataSet();
			SqlDataAdapter adapter = new SqlDataAdapter(com);
			adapter.Fill(ds);
			osgrid.DataSource = ds.Tables[0];
			osgrid.DataBind();
    	}
    }
    
    protected void OnPaging(object sender, GridViewPageEventArgs e)
    {
        osgrid.PageIndex = e.NewPageIndex;
        osgrid.DataBind();
    }
}