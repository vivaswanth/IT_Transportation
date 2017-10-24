using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class Manprofile : System.Web.UI.Page
{
    static string cons;

    static Manprofile()
    {
        cons = WebConfigurationManager.ConnectionStrings["constring"].ConnectionString;
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string user = Session["username"].ToString();
            SqlConnection con = new SqlConnection(cons);
            SqlCommand com = new SqlCommand("SELECT * FROM Manager where Email = @username", con);
            com.Parameters.AddWithValue("@username", user);
            con.Open();
            using (SqlDataReader reader = com.ExecuteReader())
            {
                if (reader.Read())
                {
                    ManID.Text = reader.GetString(0);
                    FullName.Text = reader.GetString(1);
                    gender.Text = reader.GetString(2);
                    dob.Text = Convert.ToDateTime(reader["DOB"]).ToString("dd/MM/yyyy");
                    mobile.Text = reader.GetDecimal(4).ToString();
                    email.Text = reader.GetString(5);
                    BranchID.Text = reader.GetString(8);
                    BranchID.Text += " : "+reader.GetString(7);
                    UserName.Text = reader.GetString(10);
                }
            }
        }
    }
}