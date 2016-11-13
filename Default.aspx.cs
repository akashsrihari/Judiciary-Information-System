using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"] == null)
            Response.Redirect("Default2.aspx");
        jsLabel.Text = "";
        statusLabel.Text = "";
        Label12.Text = "";
        Label20.Text = "";
        Label19.Text = "";
        Calendar1.WeekendDayStyle.BackColor = System.Drawing.Color.LightGray;
        Calendar1.SelectedDayStyle.BackColor = System.Drawing.Color.Red;
        Label12.Text = "";
        Calendar1.BackColor = System.Drawing.Color.LightGreen;
    }
    protected void homeButtonClick(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 0;
    }
    protected void addUserButtonClick(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 1;
    }
    protected void deleteUserButtonClick(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 2;
    }
    protected void deleteUserButtonSubmit(object sender, EventArgs e)
    {
        if (TextBox6.Text == "" || TextBox7.Text == "")
            jsLabel.Text = @"<script type='text/javascript'>alert('For security measures, it is mandatory to fill both the fields.');</script>";
        else
        {
            /*if (TextBox6.Text == Session["username"].ToString())
            {
                deleteStatusLabel.Text = "Cannot delete self!";
                return;
            }*/
            string connectionString = WebConfigurationManager.ConnectionStrings["JIS"].ConnectionString;
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();
            SqlCommand cmd = new SqlCommand("delete from loginDetails where username='" + TextBox6.Text + "'", conn);
            if (cmd.ExecuteNonQuery() > 0)
                deleteStatusLabel.Text = "Delete Success!";
            else
                deleteStatusLabel.Text = "Delete failed!";
        }
    }
    protected void Button7_Click(object sender, EventArgs e)
    {
        //Resets the form
        TextBox1.Text = "";
        TextBox2.Text = "";
        TextBox4.Text = "";
        TextBox5.Text = "";
        DropDownList1.SelectedIndex = 0;
    }
    protected void Button8_Click(object sender, EventArgs e)
    {
        if (DropDownList1.SelectedIndex == 0)
            statusLabel.Text = "Select a type!";
        else if (TextBox1.Text == "" || TextBox2.Text == "" || TextBox4.Text == "")
        {
            statusLabel.Text = "All fields are mandatory!";
            return;
        }
        else
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["JIS"].ConnectionString;
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();
            string type;
            if (DropDownList1.SelectedIndex == 2)
                type = "J";
            else type = "L";
            int amt = type[0] == 'J' ? -1 : 0;
            string username = type + "_" + TextBox1.Text + "_" + TextBox2.Text;
            SqlCommand cmd = new SqlCommand("insert into loginDetails values('" + username + "','" + TextBox4.Text + "'," + amt+")", conn);
            try
            {
                cmd.ExecuteNonQuery();
                statusLabel.Text = "Done! Username is: "+username;
            }
            catch (Exception e1)
            {
                statusLabel.Text = "User already exists!";
            }
        }
    }
    protected void Button12_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default3.aspx");
    }
    protected void Button13_Click(object sender, EventArgs e)
    {
        string connectionString = WebConfigurationManager.ConnectionStrings["JIS"].ConnectionString;
        SqlConnection conn = new SqlConnection(connectionString);
        conn.Open();
        string query = "update caseDetails set status='Resolved' , summary='"+TextBox9.Text+"' where CIN="+TextBox8.Text;
        SqlCommand cmd = new SqlCommand(query, conn);
        int updated = cmd.ExecuteNonQuery();
        if (updated == 0)
            Label11.Text = "Invalid CIN";
        else
            Label11.Text = "Summary Updated, Case Closed";
    }
    protected void Button11_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex=3;
    }
    protected void Button10_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 4;
    }
    protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
    {
        if (e.Day.IsToday)
            e.Cell.BackColor = System.Drawing.Color.Blue;
        if (e.Day.IsWeekend)
            e.Day.IsSelectable = false;
        TimeSpan x = e.Day.Date - DateTime.Today;
        if (x.TotalSeconds < 0)
            e.Day.IsSelectable = false;
    }
    protected void Calendar2_DayRender(object sender, DayRenderEventArgs e)
    {
        if (e.Day.IsToday)
            e.Cell.BackColor = System.Drawing.Color.Blue;
        if (e.Day.IsWeekend)
        {
            e.Day.IsSelectable = false;
            e.Cell.BackColor = System.Drawing.Color.LightGray;
        }
        TimeSpan x = e.Day.Date - DateTime.Today;
        if (x.TotalSeconds < 0)
            e.Day.IsSelectable = false;
    }
    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        Label12.Text = Calendar1.SelectedDate.ToShortDateString();
    }
    protected void Button14_Click(object sender, EventArgs e)
    {
        string connectionString = WebConfigurationManager.ConnectionStrings["JIS"].ConnectionString;
        SqlConnection conn = new SqlConnection(connectionString);
        conn.Open();
        string query = "update caseDetails set date_of_hearing='" + Calendar1.SelectedDate.ToString() + "' where CIN=" + TextBox10.Text;
        SqlCommand cmd = new SqlCommand(query, conn);
        int updated = cmd.ExecuteNonQuery();
        if (updated == 0)
            Label12.Text = "Invalid CIN";
        else
            Label12.Text = "Summary Updated, Case Closed";
    }
    protected void createCaseReset_Click(object sender, EventArgs e)
    {
        TextBox3.Text="";
        TextBox11.Text="";
        TextBox12.Text="";
        TextBox13.Text="";
        TextBox14.Text="";
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 5;
    }
    protected void createCaseSubmit_Click(object sender, EventArgs e)
    {
        string connectionString = WebConfigurationManager.ConnectionStrings["JIS"].ConnectionString;
        SqlConnection conn = new SqlConnection(connectionString);
        conn.Open();
        int CIN= DateTime.Now.Minute * 100000 + DateTime.Now.Second * 1000 + DateTime.Now.Millisecond;
        string query="insert into caseDetails values("+CIN+",'Pending','"+TextBox3.Text+"','"+TextBox11.Text+"','"+TextBox12.Text+"','"+TextBox13.Text+"','"+TextBox14.Text+"','new case','"+Calendar2.SelectedDate.ToString()+"')";
        SqlCommand cmd = new SqlCommand(query, conn);
        int updated = cmd.ExecuteNonQuery();
        if (updated == 0)
            Label19.Text = "Error!";
        else
            Label19.Text = "Case Created! CIN: "+CIN;
    }
    protected void Calendar3_DayRender(object sender, DayRenderEventArgs e)
    {
        if (e.Day.IsToday)
            e.Cell.BackColor = System.Drawing.Color.Blue;
        if (e.Day.IsWeekend)
        {
            e.Day.IsSelectable = false;
            e.Cell.BackColor = System.Drawing.Color.LightGray;
        }
        TimeSpan x = e.Day.Date - DateTime.Today;
        if (x.TotalSeconds < 0)
            e.Day.IsSelectable = false;
    }
    protected void Button15_Click(object sender, EventArgs e)
    {
        string connectionString = WebConfigurationManager.ConnectionStrings["JIS"].ConnectionString;
        SqlConnection conn = new SqlConnection(connectionString);
        conn.Open();
        int CIN = DateTime.Now.Millisecond;
        string query = "update caseDetails set date_of_hearing='" + Calendar3.SelectedDate.ToString() + "' where CIN=" + TextBox15.Text;
        SqlCommand cmd = new SqlCommand(query, conn);
        int updated = cmd.ExecuteNonQuery();
        if (updated == 0)
            Label20.Text = "Error!";
        else
            Label20.Text = "Case adjourned!";
    }
    protected void Button9_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 6;
    }
}