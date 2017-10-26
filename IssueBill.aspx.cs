using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.IO;
using iTextSharp.text;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;

public partial class IssueBill : System.Web.UI.Page
{
	static string cons;

    static IssueBill()
    {
        cons = WebConfigurationManager.ConnectionStrings["constring"].ConnectionString;
    }

    protected void Page_Load(object sender, EventArgs e)
    {
    	if(!IsPostBack)
    	{
    		string id=Request.QueryString["id"];
    		bdate.Text = DateTime.Now.ToString();
    		SqlConnection con = new SqlConnection(cons);
    		
    		try
    		{
				con.Open();
				SqlCommand com = new SqlCommand("SELECT * FROM Orders where OrderID=@id", con);
				com.Parameters.AddWithValue("@id", id);
				SqlDataReader reader = com.ExecuteReader();
	       		while(reader.Read())
	       		{          
		         	OName.Text = reader.GetString(1); 
		         	OAT.Text = reader.GetDateTime(17).ToString();
		         	ODT.Text = reader.GetString(2);
		         	OFare.Text = "Rs. "+reader.GetValue(7).ToString();
		         	
		         	OSN.Text = reader.GetValue(9).ToString();
                    OSID.Text = reader.GetValue(10).ToString();
                    OSEM.Text = reader.GetValue(11).ToString();
                    OSMO.Text = reader.GetValue(12).ToString();

                    ORN.Text = reader.GetValue(13).ToString();
                    OSID.Text = reader.GetValue(14).ToString();
                    OREM.Text = reader.GetValue(15).ToString();
                    ORMO.Text = reader.GetValue(16).ToString();


		         	OSP.Text = reader.GetValue(3).ToString();
		         	ODP.Text = reader.GetValue(4).ToString();
		         	ODS.Text = reader.GetValue(6).ToString();
		         	ORS.Text = reader.GetValue(5).ToString() + reader.GetValue(8).ToString();
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

    protected void btnExport_Click(object sender, EventArgs e)
	{
	    Response.ContentType = "application/pdf";
	    Response.AddHeader("content-disposition", "attachment;filename=TransCorp_Bill.pdf");
	    Response.Cache.SetCacheability(HttpCacheability.NoCache);
	    StringWriter sw = new StringWriter();
	    HtmlTextWriter hw = new HtmlTextWriter(sw);
	    this.Page.RenderControl(hw);
	    StringReader sr = new StringReader(sw.ToString());
	    Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 100f, 0f);
	    HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
	    PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
	    pdfDoc.Open();
	    htmlparser.Parse(sr);
	    pdfDoc.Close();
	    Response.Write(pdfDoc);
	    Response.End();
	}
}