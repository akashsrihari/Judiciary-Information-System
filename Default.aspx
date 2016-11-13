<%@ Page Title="" Language="C#" MasterPageFile="~/JIS_Master.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content2" ContentPlaceHolderID="content_here" runat="Server">
    <center>
        <asp:Label ID="jsLabel" runat="server"></asp:Label>
    <table>
        <tr>
            <th>
                <asp:Button ID="homeButton" runat="server" Text="HOME" OnClick="homeButtonClick" CausesValidation="False" Width="151px" />
            </th>
            <th>
                <asp:Button ID="addUserButton" runat="server" Text="Add User" OnClick="addUserButtonClick" CausesValidation="False" Width="148px" />
            </th>
            <th>
                <asp:Button ID="deleteUserButton" runat="server" Text="Delete User" OnClick="deleteUserButtonClick" CausesValidation="False" Width="149px"/>
            </th>
            <th>
                <asp:Button ID="Button4" runat="server" Text="Create Case" CausesValidation="False" OnClick="Button4_Click" Width="148px" />
            </th>
        </tr>
        <tr>
            <th>
                <asp:Button ID="Button9" runat="server" Text="Adjourn Case" CausesValidation="False" OnClick="Button9_Click" Width="151px" />
            </th>
            <th>
                <asp:Button ID="Button10" runat="server" Text="Assign Date" CausesValidation="False" OnClick="Button10_Click" Width="148px" />
            </th>
            <th>
                <asp:Button ID="Button11" runat="server" Text="Close Case" CausesValidation="False" OnClick="Button11_Click" Width="148px" />
            </th>
            <th>
                <asp:Button ID="Button12" runat="server" Text="View Cases" OnClick="Button12_Click" CausesValidation="False" Width="150px" />
            </th>
        </tr>
    </table>
        </center>
    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
        <asp:View ID="homeView" runat="server">
            <center>
            <asp:Label ID="Label1" runat="server" Text="Welcome to User Management of JIS. You can Add/Delete members here by choosing from above.&lt;br&gt;You are currently under HOME section."></asp:Label>
            </center>
        </asp:View>
        <asp:View ID="addUserView" runat="server">
            <center>
            <asp:Label ID="Label2" runat="server" Text="Enter the details and click on 'Submit'. JIS will do the rest for you."></asp:Label>
            <table>
                <tr>
                    <th>
                        <asp:Label ID="Label3" runat="server" Text="First Name:"></asp:Label>
                    </th>
                    <th>
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    </th>
                    <th>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Letters Only!" ControlToValidate="TextBox1" ValidationExpression="\w+"></asp:RegularExpressionValidator>
                    </th>
                </tr>
                <tr>
                    <th>
                        <asp:Label ID="Label4" runat="server" Text="Last Name:"></asp:Label></th>
                    <th>
                        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                    </th>
                    <th>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Letters Only!" ControlToValidate="TextBox2" ValidationExpression="[a-zA-Z]+"></asp:RegularExpressionValidator>
                    </th>
                </tr>
                <tr>
                    <th>
                        <asp:Label ID="Label5" runat="server" Text="Type:"></asp:Label>
                    </th>
                    <th>
                        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True">
                            <asp:ListItem>Choose...</asp:ListItem>
                            <asp:ListItem>Lawyer</asp:ListItem>
                            <asp:ListItem>Judge</asp:ListItem>
                        </asp:DropDownList>
                    </th>
                </tr>
                <tr>
                    <th>
                        <asp:Label ID="Label6" runat="server" Text="Password:"></asp:Label></th>
                    <th>
                        <asp:TextBox ID="TextBox4" runat="server" TextMode="Password"></asp:TextBox>
                    </th>
                </tr>
                <tr>
                    <th>
                        <asp:Label ID="Label7" runat="server" Text="Confirm Password:"></asp:Label>
                    </th>
                    <th>
                        <asp:TextBox ID="TextBox5" runat="server" TextMode="Password"></asp:TextBox>
                    </th>
                    <th>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Passwords must match!" ControlToValidate="TextBox5" ControlToCompare="TextBox4"></asp:CompareValidator>
                    </th>
                </tr>
            </table>
                <asp:Label ID="statusLabel" runat="server"></asp:Label>
            <br />
            <table>
                <tr>
                    <th>
                            <asp:Button ID="Button7" runat="server" Text="Reset" OnClick="Button7_Click" CausesValidation="False" />
                    </th>
                    <th>
                            <asp:Button ID="Button8" runat="server" Text="Submit" OnClick="Button8_Click" />
                    </th>
                </tr>
            </table>
        </center>
        </asp:View>
        <asp:View ID="deleteUserView" runat="server">
            <center>
            <asp:Label ID="Label8" runat="server" Text="Enter the details and click on 'Submit'. JIS will do the rest for you."></asp:Label>
            <table>
                <tr>
                    <th>
                        <asp:Label ID="Label9" runat="server" Text="Username:"></asp:Label>
                    </th>
                    <th>
                        <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                    </th>
                </tr>
                <tr>
                    <th>
                        <asp:Label ID="Label10" runat="server" Text="First Name:"></asp:Label>
                    </th>
                    <th>
                        <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
                    </th>
                </tr>
                </table>
                <asp:Button ID="Button6" runat="server" Text="Delete" OnClick="deleteUserButtonSubmit"/>
                <br />
                <asp:Label ID="deleteStatusLabel" runat="server"></asp:Label>
        </asp:View>
        <asp:View ID="View4" runat="server">
            <center>
                Enter CIN:&nbsp; <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
            &nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox8" ErrorMessage="Please enter CIN"></asp:RequiredFieldValidator>
                <br />
                <br />
                Enter Summary:&nbsp; <asp:TextBox ID="TextBox9" runat="server" TextMode="MultiLine"></asp:TextBox>
                &nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox9" ErrorMessage="Please enter summary"></asp:RequiredFieldValidator>
                <br />
                <br />
                <asp:Label ID="Label11" runat="server"></asp:Label>
                <br />
            <br />
            <asp:Button ID="Button13" runat="server" Text="Close" OnClick="Button13_Click" />
                </center>
        </asp:View>

        <asp:View ID="View5" runat="server">
            <center>
                <br />
                Enter CIN :
                <asp:TextBox ID="TextBox10" runat="server"></asp:TextBox>
                &nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox10" ErrorMessage="Please enter CIN"></asp:RequiredFieldValidator>
                <br />
                <br />
            <table>
                <tr>
                    <th>
                        Select Date of Hearing:
                    </th>
                    <th>
                        <asp:Calendar ID="Calendar1" runat="server" OnDayRender="Calendar1_DayRender" OnSelectionChanged="Calendar1_SelectionChanged"></asp:Calendar>
                    </th>
                    <th class="auto-style1">
                        * Green: Selectable <br />
                        * Gray: Not Selectable. <br />
                        *Red: Current Selection<br />
                        *Blue: Today
                    </th>
                </tr>
            </table>
                <asp:Label ID="Label12" runat="server"></asp:Label>
                <br />
                <br />
                <asp:Button ID="Button14" runat="server" Text="Assign" OnClick="Button14_Click" />
        <br />
                </center>
        </asp:View>

        <asp:View ID="View6" runat="server">
            <center>By Default all cases created are pending. CIN is generated automatically.
                <table>
                    <tr>
                        <th>
                            <asp:Label ID="Label13" runat="server" Text="Crime Type: "></asp:Label>
                        </th>
                        <th>
                            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                        </th>
                    </tr>
                    <tr>
                        <th>
                            <asp:Label ID="Label14" runat="server" Text="Judge's Name: "></asp:Label>
                        </th>
                        <th>
                            <asp:TextBox ID="TextBox11" runat="server"></asp:TextBox>
                        </th>
                    </tr>
                    <tr>
                        <th>
                            <asp:Label ID="Label15" runat="server" Text="Criminal's Name: "></asp:Label>
                        </th>
                        <th>
                            <asp:TextBox ID="TextBox12" runat="server"></asp:TextBox>
                        </th>
                    </tr>
                    <tr>
                        <th>
                            <asp:Label ID="Label16" runat="server" Text="Arresting Officer's Name: "></asp:Label>
                        </th>
                        <th>
                            <asp:TextBox ID="TextBox13" runat="server"></asp:TextBox>
                        </th>
                    </tr>
                    <tr>
                        <th>
                            <asp:Label ID="Label17" runat="server" Text="Lawyer's Name: "></asp:Label>
                        </th>
                        <th>
                            <asp:TextBox ID="TextBox14" runat="server"></asp:TextBox>
                        </th>
                    </tr>
                    <tr>
                        <th>
                            <asp:Label ID="Label18" runat="server" Text="Date of Hearing: "></asp:Label>
                        </th>
                        <th>
                            <asp:Calendar ID="Calendar2" runat="server" OnDayRender="Calendar2_DayRender"></asp:Calendar>
                        </th>
                    </tr>
                </table>
                <asp:Label ID="Label19" runat="server"></asp:Label>
                <br />
                <table>
                    <tr>
                        <th>
                            <asp:Button ID="createCaseReset" runat="server" Text="Reset" OnClick="createCaseReset_Click"></asp:Button>
                        </th>
                        <th>
                            <asp:Button ID="createCaseSubmit" runat="server" Text="Submit" OnClick="createCaseSubmit_Click"></asp:Button>
                        </th>
                    </tr>
                </table>
            </center>
        </asp:View>

        <asp:View ID="View7" runat="server">
            <center>
                Enter CIN:&nbsp; <asp:TextBox ID="TextBox15" runat="server"></asp:TextBox>
            &nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox15" ErrorMessage="Please enter CIN"></asp:RequiredFieldValidator>
                <br />
                <br />
                Enter Reason:&nbsp; <asp:TextBox ID="TextBox16" runat="server" TextMode="MultiLine"></asp:TextBox>
                &nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox16" ErrorMessage="Please enter reason"></asp:RequiredFieldValidator>
                <br />
                <br />
                Select Date of adjournment from below
                <asp:Calendar ID="Calendar3" runat="server" OnDayRender="Calendar3_DayRender"></asp:Calendar>
                <br />
                <asp:Label ID="Label20" runat="server"></asp:Label>
                <br />
                <asp:Button ID="Button15" runat="server" OnClick="Button15_Click" Text="Adjourn" />
                </center>
        </asp:View>
        <br />

    </asp:MultiView>
</asp:Content>

<asp:Content ID="Content3" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .auto-style1 {
            width: 147px;
        }
    </style>
</asp:Content>


