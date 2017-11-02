using System;
using System.Collections.Generic;
using System.Linq;
 using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class ViewOrderDetails : System.Web.UI.Page
{

	static string cons;

    static ViewOrderDetails()
    {
        cons = WebConfigurationManager.ConnectionStrings["constring"].ConnectionString;
    }

    protected void Page_Load(object sender, EventArgs e)
    {
    	if(!IsPostBack)
    	{
    		string id=Request.QueryString["id"];
    		oid.Text=id;
            
    		SqlConnection con = new SqlConnection(cons);
    		
    		try
    		{
				con.Open();
                string sendid = null;
                string recvid = null;
				SqlCommand com = new SqlCommand("SELECT * FROM Orders where OrderID=@id", con);
				com.Parameters.AddWithValue("@id", id);
				SqlDataReader reader = com.ExecuteReader();
	       		while(reader.Read())
	       		{          
		         	OName.Text = reader.GetValue(1).ToString();
		         	OAT.Text = reader.GetValue(17).ToString();
		         	ODT.Text = reader.GetValue(2).ToString();
		         	OFare.Text = reader.GetValue(7).ToString();

                    OSN.Text = reader.GetValue(9).ToString();
                    OSID.Text = reader.GetValue(10).ToString();
                    OSEM.Text = reader.GetValue(11).ToString();
                    OSMO.Text = reader.GetValue(12).ToString();

                    ORN.Text = reader.GetValue(13).ToString();
                    ORID.Text = reader.GetValue(14).ToString();
                    OREM.Text = reader.GetValue(15).ToString();
                    ORMO.Text = reader.GetValue(16).ToString();

		         	OSP.Text = reader.GetValue(3).ToString();
		         	ODP.Text = reader.GetValue(4).ToString();
		         	ODS.Text = reader.GetValue(6).ToString();
		         	ORS.Text = "Volume :" + reader.GetValue(5).ToString() + reader.GetValue(8).ToString();
		         	ps.Text = reader.GetValue(18).ToString();
		         	if(ps.Text == "Amount Paid")
		         	{
		         		BCancel.Enabled=false;
						BPayment.Enabled=false;
		         	}
	       		}

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

    protected void GenerateBill(object sender, EventArgs e)
    {
    	Response.Redirect("IssueBill.aspx?id="+Request.QueryString["id"]);
    }

    protected void Paydone(object sender, EventArgs e)
    {
    	SqlConnection con = new SqlConnection(cons);
    	try
    	{
    		con.Open();
			SqlCommand com = new SqlCommand("UPDATE Orders set PaymentStatus=@ps where OrderID=@id", con);
			com.Parameters.AddWithValue("@id", Request.QueryString["id"]);
			com.Parameters.AddWithValue("@ps", "Amount Paid");
			com.ExecuteNonQuery();
    	}
    	catch(Exception ex)
    	{

    	}
    	finally
    	{
    		con.Close();
    	}
    }

    protected void Cancelorder(object sender, EventArgs e)
    {
    	SqlConnection con = new SqlConnection(cons);
    	try
    	{
    		con.Open();
			SqlCommand com = new SqlCommand("DELETE from Orders where OrderID=@id", con);
			com.Parameters.AddWithValue("@id", Request.QueryString["id"]);
			com.ExecuteNonQuery();
			ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Order Cancelled')", true);
			Response.Redirect("Pastorders.aspx");
    	}
    	catch(Exception ex)
    	{

    	}
    	finally
    	{
    		con.Close();
    	}
    }

    protected void Alloc_truck(object sender, EventArgs e)
    {
        string volume = null;
        try
        {
            SqlConnection con = new SqlConnection(cons);
            con.Open();
            SqlCommand com = new SqlCommand("SELECT * FROM Orders where OrderID=@id", con);
            com.Parameters.AddWithValue("@id", Request.QueryString["id"]);
            SqlDataReader reader = com.ExecuteReader();
            while(reader.Read())
            {
                volume = reader.GetValue(5).ToString();
            }

        }
        catch(Exception ex)
        {

        }

        Response.Redirect("Loadcargo.aspx?Id="+Server.UrlEncode(Request.QueryString["id"])+"&vol="+volume);
    }

}