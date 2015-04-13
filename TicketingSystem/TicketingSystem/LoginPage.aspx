<%@ Page Title="" Language="C#" MasterPageFile="~/FirstMaster.Master" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="EmulationGroupProject.LoginPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="padding-left:500px;"><asp:Label ID="lblTicketingSystem" runat="server" Text="TICKETING SYSTEM" Font-Bold="True" Font-Size="X-Large"></asp:Label></div>
    <br /> <br />
    <div style="border-color:red; border-style:solid; border-radius:7px; background-color:#E1DBC7; margin:auto; width: 506px; padding-left:10px; padding-top:5px; text-align:center; height: 171px;">
        <h3>Please login: </h3><br />
        <table  style="height: 140px; width: 459px;">
            <tr>
                <td style="height: 27px">
                    E-mail:
                </td>
                <td style="height: 27px">
                   <%-- <input id="txtEmail" type="text" required />--%>
                    <asp:TextBox ID="txtEmail" runat="server" Height="21px" Width="230px" TextMode="Email"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Password:
                </td>
                <td>
                   <%-- <input id="txtPassword" type="text" required />--%>
                    <asp:TextBox ID="txtPassword" runat="server" Height="21px" Width="230px" TextMode="Password"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td style="text-align:right">
                    <asp:Button ID="btnSubmit" runat="server" Text="Login" Height="27px" Width="95px" OnClick="btnSubmit_Click" BackColor="#CC0000" BorderColor="#CC0000" Font-Bold="True" ForeColor="White"/>
                </td>
            </tr>
        </table>
        <asp:Label ID="lblMessage" runat="server" Font-Bold="True" ForeColor="#CCCCCC" ></asp:Label>
    </div>
</asp:Content>
