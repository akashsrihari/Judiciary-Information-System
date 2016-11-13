using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class Default4 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"] == null)
            Response.Redirect("Default2.aspx");
        string connectionString = WebConfigurationManager.ConnectionStrings["JIS"].ConnectionString;
        SqlConnection conn = new SqlConnection(connectionString);
        conn.Open();
        string query = "Select amount from loginDetails where username='" + Session["username"] + "'";
        SqlCommand cmd = new SqlCommand(query, conn);
        SqlDataReader dr = cmd.ExecuteReader();
        dr.Read();
        Label1.Text = dr["amount"].ToString();
        conn.Close();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string connectionString = WebConfigurationManager.ConnectionStrings["JIS"].ConnectionString;
        SqlConnection conn = new SqlConnection(connectionString);
        conn.Open();
        string query = "update loginDetails set amount=0 where username='" + Session["username"] + "'";
        SqlCommand cmd = new SqlCommand(query, conn);
        cmd.ExecuteNonQuery();
        Label1.Text = "0";
        conn.Close();
    }
}