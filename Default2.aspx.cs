using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        jsLabel.Text = "";
        testLabel.Text = "";
        Button testButton = (Button)this.Master.FindControl("Button1");
        testButton.Visible = false;
    }
    protected void loginButtonClick(object sender,EventArgs e)
    {
        if (usernameText.Text == "" || passwordText.Text == "")
        {
            jsLabel.Text = @"<script type='text/javascript'>alert('Check Username/Password!');</script>";
        }
        else
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["JIS"].ConnectionString;
            SqlConnection conn=new SqlConnection(connectionString);
            conn.Open();
            SqlCommand cmd = new SqlCommand("select pass from loginDetails where username='" + usernameText.Text + "'", conn);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                string test = passwordText.Text;
                if (test.Equals(dr["pass"].ToString()))
                {
                    Session["username"] = usernameText.Text;
                    if (usernameText.Text[0] == 'J' || usernameText.Text[0] == 'L')
                        Response.Redirect("Default3.aspx");
                    else
                        Response.Redirect("Default.aspx");
                }
                else //testLabel.Text = usernameText.Text + "/" + passwordText.Text + "/" + dr["pass"].ToString().Length;
                    //
                    testLabel.Text = "Invalid credentials!";
            }
            else
                jsLabel.Text = @"<script type='text/javascript'>alert('Invalid Username/Password!');</script>";
        }
    }
}