<%@ Page Title="" Language="C#" MasterPageFile="~/JIS_Master.master" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content2" ContentPlaceHolderID="content_here" runat="Server">
    <asp:Label ID="testLabel" runat="server" Text=""></asp:Label>
    <asp:Label ID="jsLabel" runat="server" Text=""></asp:Label>
    <center>
    <asp:Label ID="Label2" runat="server"><h1>Login Portal</h1></asp:Label>
        <table>
            <tr>
                <th><asp:Label ID="Label3" runat="server">Username:</asp:Label></th>
                <th><asp:TextBox ID="usernameText" runat="server"></asp:TextBox></th>
            </tr>
            <tr>
                <th><asp:Label ID="Label4" runat="server">Password:</asp:Label></th>
                <th><asp:TextBox ID="passwordText" runat="server" TextMode="Password"></asp:TextBox></th>
            </tr>
        </table>
        <asp:Button ID="loginButton" runat="server" Text="Login" OnClick="loginButtonClick"/>
    </center>
</asp:Content>

