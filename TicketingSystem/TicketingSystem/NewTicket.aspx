<%@ Page Title="" Language="C#" MasterPageFile="~/FirstMaster.Master" AutoEventWireup="true" CodeBehind="NewTicket.aspx.cs" Inherits="TicketingSystem.NewTicket" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="border-color:red; border-style:solid; border-radius:7px; background-color:#E1DBC7; margin:auto; height: 400px; width: 600px; padding-left:40px; padding-top:5px; text-align:center;">
        <br /><br /><div style="padding-right:40px;">
        <asp:Label ID="lblSubmitTicket" runat="server" Text="SUBMIT TICKET" Font-Bold="True" Font-Size="Large"></asp:Label><br />
        </div><br /><br />
        <table>
            <tr><td style="width: 230px">
                IT issue:
                </td><td style="width: 380px">
                    <asp:DropDownList ID="ddItIssue" runat="server" Height="28px" Width="250px"></asp:DropDownList>
                     </td></tr>
            <tr><td style="width: 230px">
                Summary:
                </td><td style="width: 380px">
                    <asp:TextBox ID="txtSummary" runat="server" Height="28px" Width="400px"></asp:TextBox>
                     </td></tr>
            <tr><td style="width: 230px">
                Description:
                <br /><br /><br /><br />
                </td><td style="width: 380px">
                    <asp:TextBox ID="txtDescription" runat="server" Height="100px" Width="400px"></asp:TextBox>
                     </td></tr>
            <tr><td style="width: 230px; padding-top:10px;">
                Attachment: (optional)
                </td><td style="width: 380px; padding-top:10px;">
                    <asp:FileUpload ID="FileUpload1" runat="server" Height="28px" /><asp:LinkButton ID="btnClearAttachment" runat="server">clear attachment</asp:LinkButton>
                </td></tr>
            <tr><td style="width: 230px">
                </td><td style="width: 380px; padding-left:250px; padding-top:20px;">
                    <asp:Button ID="btnSubmitRequest" runat="server" Text="Submit Request" Height="30px" Width="150px" BackColor="#CC0000" BorderColor="#CC0000" Font-Bold="True" ForeColor="White" Font-Size="Small"/>
                     </td></tr>
            </table>
    </div>
</asp:Content>
