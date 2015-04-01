<%@ Page Title="" Language="C#" MasterPageFile="~/FirstMaster.Master" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="EmulationGroupProject.LoginPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="text-align:center"><asp:Label ID="lblTicketingSystem" runat="server" Text="Ticketing System" Font-Bold="True" Font-Size="X-Large"></asp:Label></div>
    <br />
    <div style="border-color:red; border-style:solid; margin:auto; width: 506px; padding-left:10px; padding-top:5px; text-align:center; height: 171px;">
        <h3>Please login: </h3><br />
        <table  style="height: 140px; width: 459px">
            <tr>
                <td style="height: 27px">
                    E-mail:
                </td>
                <td style="height: 27px">
                    <input id="txtEmail" type="text" required />
                </td>
            </tr>
            <tr>
                <td>
                    Password:
                </td>
                <td>
                    <input id="txtPassword" type="text" required />
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td style="text-align:right">
                    <asp:Button ID="btnSubmit" runat="server" Text="Login" Height="24px" Width="87px" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
