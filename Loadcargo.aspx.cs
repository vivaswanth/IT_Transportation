using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class Loadcargo : System.Web.UI.Page
{
	static string cons;

    static Loadcargo()
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
			lcgrid.DataSource = ds.Tables[0];
			lcgrid.DataBind();
			con.Close();
    	}
    }

    protected void OnPaging(object sender, GridViewPageEventArgs e)
    {
        lcgrid.PageIndex = e.NewPageIndex;
        lcgrid.DataBind();
    }

    protected void Allocate(object sender, EventArgs e)
    {
    	SqlConnection con = new SqlConnection(cons);
    	string Id = (sender as LinkButton).CommandArgument;
    	//label.Text=Id;
    	string vol = Request.QueryString["vol"];
    	string current_capacity = null;
    	try
    	{
    		con.Open();
    		SqlCommand com = new SqlCommand("SELECT * from Trucks where TruckID=@Id", con);
			com.Parameters.AddWithValue("@Id",Id);
			SqlDataReader reader = com.ExecuteReader();
			//label.Text = Request.QueryString["vol"];
            while(reader.Read())
            {
                current_capacity = reader.GetValue(4).ToString();

            }
            reader.Close();

            if(Convert.ToInt32(current_capacity)>=Convert.ToInt32(vol))
            {
            	SqlCommand com1 = new SqlCommand("INSERT INTO Tracking(OrderID, TruckID, AverageWaitingTime, CurrentLocation, Status, OwnerID) Values(@oid, @tid, @awt, @culoc, @status, @ownid)", con);
				com1.Parameters.AddWithValue("@oid", Request.QueryString["id"]);
				com1.Parameters.AddWithValue("@tid", Id);
				com1.Parameters.AddWithValue("@awt", DateTime.Now);
				com1.Parameters.AddWithValue("@culoc", Session["Location"]);
				com1.Parameters.AddWithValue("@status", "TobeDelivered");
				com1.Parameters.AddWithValue("@ownid", Session["MID"]);            
				com1.ExecuteNonQuery();	

				SqlCommand com2 = new SqlCommand("UPDATE Trucks set Capacity = @capacity where TruckID=@Id", con);
				com2.Parameters.AddWithValue("@capacity", (Convert.ToInt32(current_capacity)-Convert.ToInt32(vol)));
				com2.Parameters.AddWithValue("@Id", Id);
				com2.ExecuteNonQuery();
            }

			ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Truck Data Submitted Successfully')", true);

    	}
    	catch(Exception ex)
    	{
    		label.Text="exception"+ex;
    	}
    	finally
    	{
    		con.Close();
    	}
    }
}