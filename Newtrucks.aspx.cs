using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class Newtrucks : System.Web.UI.Page
{
	static string cons;

    static Newtrucks()
    {
        cons = WebConfigurationManager.ConnectionStrings["constring"].ConnectionString;
    }

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Insert_trucks(object sender, EventArgs e)
    {
    	SqlConnection con = new SqlConnection(cons);

    	try
    	{
    		con.Open();
    		SqlCommand com = new SqlCommand("INSERT INTO Trucks(TruckID, LicenseNum, Status, OwnerID, Capacity, Model, AverageWaitingTime) Values(@tid, @lnum, @status, @owner, @capacity, @model, @awt)", con);
			com.Parameters.AddWithValue("@tid", TID.Text);
			com.Parameters.AddWithValue("@lnum", TLinum.Text);
			com.Parameters.AddWithValue("@status", TStatus.Text);
			com.Parameters.AddWithValue("@owner", Session["MID"]);
			com.Parameters.AddWithValue("@capacity", 500);
			com.Parameters.AddWithValue("@model", TModel.Text);
            com.Parameters.AddWithValue("@awt", DateTime.Now);
			com.ExecuteNonQuery();
			ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Truck Data Submitted Successfully')", true);

    	}
    	catch(Exception ex)
    	{

    	}
    	finally
    	{
    		con.Close();
    	}
    }
}