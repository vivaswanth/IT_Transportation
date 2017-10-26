using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class Dashboard : System.Web.UI.Page
{

	static string cons;

    static Dashboard()
    {
        cons = WebConfigurationManager.ConnectionStrings["constring"].ConnectionString;
    }

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Place_order(object sender, EventArgs e)
    {
    	SqlConnection con = new SqlConnection(cons);
    	double fare = 0;
    	fare = Convert.ToDouble(Convert.ToInt32(OVol.Text) * Convert.ToInt32(ODist.Text) * 0.08);

    	try
    	{
    		con.Open();
    		SqlCommand com = new SqlCommand("INSERT INTO Orders(OrderID, OName, CDetails, Source, Dest, Volume, Distance, Fare, Remarks, SName, SID, SMobile, SEmail, RName, RID, RMobile, REmail, ArrivalTime, PaymentStatus) Values(@oid, @oname, @consdet, @from, @to, @volume, @dist, @fare, @remarks, @sendname, @sendid, @sendmob, @sendemail, @recvname, @recvid, @recvmob, @recvemail, @arrtime, @paystatus)", con);

    		com.Parameters.AddWithValue("@oid", Guid.NewGuid());
			com.Parameters.AddWithValue("@oname", OName.Text);
			com.Parameters.AddWithValue("@consdet", ODetails.Text);
			com.Parameters.AddWithValue("@from", Session["Location"]);
			com.Parameters.AddWithValue("@to", OTo.Text);
			com.Parameters.AddWithValue("@volume", OVol.Text);
			
			com.Parameters.AddWithValue("@arrtime", DateTime.Now);
			com.Parameters.AddWithValue("@remarks", ORemarks.Text);
			com.Parameters.AddWithValue("@fare", fare);
			com.Parameters.AddWithValue("@dist", ODist.Text);

			com.Parameters.AddWithValue("@sendname", OSender.Text);
			com.Parameters.AddWithValue("@sendmob", OSMobile.Text);
			com.Parameters.AddWithValue("@sendemail", OSEmail.Text);
			com.Parameters.AddWithValue("@sendid", OSID.Text);

			com.Parameters.AddWithValue("@recvname", OReceiver.Text);
			com.Parameters.AddWithValue("@recvmob", ORMobile.Text);
			com.Parameters.AddWithValue("@recvemail", OREmail.Text);
			com.Parameters.AddWithValue("@recvid", ORID.Text);

			com.Parameters.AddWithValue("@paystatus", "not paid");
			com.ExecuteNonQuery();

			string message = "Your details have been saved successfully.";
		    string script = "window.onload = function(){ alert('";
		    script += message;
		    script += "');";
		    script += "window.location = '";
		    script += Request.Url.AbsoluteUri;
		    script += "'; }";
		    ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script, true);
			
    	}
    	catch(Exception ex)
    	{

    	}
    	finally
    	{
    		con.Close();
    	}
    }

    protected void Calculate_fare(object sender, EventArgs e)
    {
    	double fare = 0;
    	fare = Convert.ToDouble(Convert.ToInt32(OVol.Text) * Convert.ToInt32(ODist.Text) * 0.08);
    	string message = "Estimated Fare : Rs. "+fare;
		System.Text.StringBuilder sb = new System.Text.StringBuilder();
		sb.Append("<script type = 'text/javascript'>");
		sb.Append("window.onload=function(){");
		sb.Append("alert('");
		sb.Append(message);
		sb.Append("')};");
		sb.Append("</script>");
		ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());
    }

}