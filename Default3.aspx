<%@ Page Title="" Language="C#" MasterPageFile="~/JIS_Master.master" AutoEventWireup="true" CodeFile="Default3.aspx.cs" Inherits="Default3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 714px;
        }
        .auto-style2 {
            width: 525px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content_here" Runat="Server">
    <p>
        <br />
        <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="HomePage" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Wallet" />
    </p>
	<table>
        &nbsp;
		<tr>
		<th>
		CIN:
		</th>
		<th>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
		</th>
        <br />
		<th>
        Select status:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		</th>
		<th>
        <asp:DropDownList ID="DropDownList1" runat="server">
            <asp:ListItem>Any</asp:ListItem>
            <asp:ListItem>Pending</asp:ListItem>
            <asp:ListItem>Resolved</asp:ListItem>
        </asp:DropDownList>
		</th>
        <br />
		<th>
        Select crime:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		</th>
		<th>
        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="crime">
            <asp:ListItem>All</asp:ListItem>
        </asp:DropDownList>
		</th>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        <br />
            </tr>
        <tr>
		<th>
        Name of Presiding Judge:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </th>
		<th>
		<asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        </th>
		<br />
		<th>
        Name of Criminal:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </th>
		<th>
		<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        </th>
		<br />
		<th>
        Name of Arresting Officer:&nbsp;&nbsp;&nbsp;
&nbsp;</th><th><asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
        &nbsp;&nbsp;
        <br />
		</th>
            </tr>
        <tr>
            <th>
                Lawyer's Name:
            </th>
            <th>
                <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
            </th>
        </tr>

        </th>
	</table>
        <asp:Button ID="Button2" runat="server" Text="Search" OnClick="Button2_Click" />

    &nbsp;&nbsp;&nbsp;
<asp:Button ID="Button5" runat="server" OnClick="Button5_Click" Text="View Upcoming Cases " />

    <asp:Label ID="testLabel" runat="server"></asp:Label>

    <p>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:JIS %>" SelectCommand="Select * from caseDetails where CIN=@CIN">
            <SelectParameters>
                <asp:ControlParameter ControlID="ListBox1" PropertyName="SelectedValue" Name="CIN" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
        <table>
            <tr>
                <th>
                    <asp:ListBox ID="ListBox1" runat="server" AutoPostBack="True" Height="98px" OnSelectedIndexChanged="ListBox1_SelectedIndexChanged" Width="388px"></asp:ListBox>
                </th>
                <th class="auto-style2">

                    &nbsp;</th>
                <th class="auto-style1">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:DetailsView ID="DetailsView1" runat="server" Height="153px" Width="301px" DataSourceID="SqlDataSource1"></asp:DetailsView>
                </th>
            </tr>
        </table>
     
    <p>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" SelectCommand="select distinct crime from caseDetails" ConnectionString="<%$ ConnectionStrings:JIS %>"></asp:SqlDataSource>
    </p>
</asp:Content>

