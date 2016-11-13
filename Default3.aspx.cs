using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class Default3 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"] == null)
            Response.Redirect("Default2.aspx");
        if (!this.IsPostBack)
        {
            ListBox1.Items.Clear();

        }
        if (Session["username"] != null && Session["username"].ToString()[0] == 'L')
            Button3.Visible = true;
        else
            Button3.Visible = false;

        if (Session["username"] != null && Session["username"].ToString() == "admin")
            Button4.Visible = true;
        else
            Button4.Visible = false;
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default4.aspx");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        ListBox1.Items.Clear();
        testLabel.Text = "";
        int flag = 0;
        string searchQuery = "";
        if (TextBox1.Text != "" || DropDownList1.Text != "Any" || DropDownList2.Text != "All" || TextBox4.Text.Length > 0 || TextBox2.Text.Length > 0 || TextBox3.Text.Length > 0 || TextBox5.Text.Length > 0)
        {
            searchQuery = "select CIN from caseDetails where ";
        }
        else
        {
            searchQuery = "select CIN from caseDetails";
        }
        if (TextBox1.Text != "")
        {
            searchQuery += "CIN=" + TextBox1.Text + " ";
            flag = 1;
        }
        if (DropDownList1.Text != "Any")
        {
            if (flag == 1)
                searchQuery += "and status='" + DropDownList1.Text + "'";
            else
            {
                searchQuery += "status='" + DropDownList1.Text + "'";
                flag = 1;
            }
        }
        if (DropDownList2.Text != "All")
        {
            if (flag == 1)
                searchQuery += " and crime='" + DropDownList2.Text + "'";
            else
            {
                searchQuery += " crime='" + DropDownList2.Text + "'";
                flag = 1;
            }
        }
        if (TextBox4.Text.Length > 0)
        {
            if(flag==1)
                searchQuery += "and judge='" + TextBox4.Text + "'";
            else
            {
                searchQuery += "judge='" + TextBox4.Text + "'";
                flag = 1;
            }
        }
        if (TextBox2.Text.Length > 0)
        {
            if(flag==1)
                searchQuery += "and criminal='" + TextBox2.Text + "'";
            else
            {
                searchQuery += "criminal='" + TextBox2.Text + "'";
                flag = 1;
            }
        }
        if (TextBox3.Text.Length > 0)
        {
            if(flag==1)
                searchQuery += "and arrestOfficer='" + TextBox3.Text + "'";
            else
            {
                searchQuery += "arrestOfficer='" + TextBox3.Text + "'";
                flag = 1;
            }
        }
        if (TextBox5.Text.Length > 0)
        {
            if(flag == 1)
                searchQuery += "and lawyer='" + TextBox5.Text + "'";
            else
            {
                searchQuery += "lawyer='" + TextBox5.Text + "'";
                flag = 1;
            }
        }
        //testLabel.Text = searchQuery;
        string connectionString = WebConfigurationManager.ConnectionStrings["JIS"].ConnectionString;
        SqlConnection conn = new SqlConnection(connectionString);
        conn.Open();
        SqlCommand cmd = new SqlCommand(searchQuery, conn);
        SqlDataReader dr=cmd.ExecuteReader();
        int f = 0;
        while (dr.Read())
        {
            f = 1;
            ListBox1.Items.Add(dr["CIN"].ToString());
        }
        if (f == 0)
            testLabel.Text = "No results found!";
    }
    protected void ListBox1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if(Session["username"].ToString()[0] == 'L')
        {
            //string confirmValue = Request.Form["confirm_value"];
            //if (confirmValue == "Yes")
            //{
            string connectionString = WebConfigurationManager.ConnectionStrings["JIS"].ConnectionString;
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();
            string query = "update loginDetails set amount = amount + 100 where username='" + Session["username"] + "'";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.ExecuteNonQuery();
            conn.Close();
            //}
            //else
            //{
                return;
            //}
        }
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }
    protected void Button5_Click(object sender, EventArgs e)
    {
        ListBox1.Items.Clear();
        string connectionString = WebConfigurationManager.ConnectionStrings["JIS"].ConnectionString;
        SqlConnection conn = new SqlConnection(connectionString);
        conn.Open();
        string query = "Select * from caseDetails";
        SqlCommand cmd = new SqlCommand(query, conn);
        SqlDataReader dr = cmd.ExecuteReader();

        while (dr.Read())
        {
            if (dr["date_of_hearing"].ToString().Length == 0)
                continue;
            string tester = dr["date_of_hearing"].ToString();
            int day = Int32.Parse(tester.Substring(0, 2));
            int month = Int32.Parse(tester.Substring(3, 2));
            int year = Int32.Parse(tester.Substring(6, 4));
            DateTime test = new DateTime(year, month, day);
            if (test > DateTime.Today)
            {
                ListBox1.Items.Add(dr["CIN"].ToString());
            }
        }
    }
}