<%@ Page Title="" Language="C#" MasterPageFile="~/FirstMaster.Master" AutoEventWireup="true" CodeBehind="EditTicket.aspx.cs" Inherits="TicketingSystem.EditTicket" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="border-color:red; border-style:solid; border-radius:7px; background-color:#E1DBC7; margin:auto; height: 500px; width: 600px; padding-left:40px; padding-top:5px; text-align:center;">
        <br /><br /><div style="padding-right:40px;">
        <asp:Label ID="lblEditTicket" runat="server" Text="EDIT TICKET" Font-Bold="True" Font-Size="Large"></asp:Label><br />
        </div><br /><br />
        <table>
             <tr><td style="width: 230px">
                 Ticket Category:</td><td style="width: 380px">
                    <asp:DropDownList ID="ddlTicketCat" runat="server" Height="28px" Width="250px"  ></asp:DropDownList>
                     </td></tr>
              <tr><td style="width: 230px">
                 Ticket Status</td><td style="width: 380px">
                    <asp:DropDownList ID="ddlTicketStatus" runat="server" Height="28px" Width="250px"></asp:DropDownList>
                     </td></tr>
              <tr><td style="width: 230px">
                 Ticket Priority:</td><td style="width: 380px">
                    <asp:DropDownList ID="ddlTicketPriority" runat="server" Height="28px" Width="250px"></asp:DropDownList>
                     </td></tr>
              <tr><td style="width: 230px">Assignee</td><td style="width: 380px">
                    
                     <asp:DropDownList ID="ddlAssignee" runat="server" Height="28px" Width="250px" ></asp:DropDownList>
                    
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
                    <asp:TextBox ID="txtDescription" runat="server" Height="100px" Width="400px" TextMode="MultiLine"></asp:TextBox>
                     </td></tr>
            <tr><td style="width: 230px; padding-top:10px;">
                &nbsp;</td><td style="width: 380px; padding-top:10px;">
                     <asp:Button ID="btnEditTicket" runat="server" Text="Edit Request" Height="30px" Width="150px" BackColor="#CC0000" BorderColor="#CC0000" Font-Bold="True" ForeColor="White" Font-Size="Small" OnClick="btnEditTicket_Click" />
                     </td></tr>
            <tr><td style="width: 230px">
                </td><td style="width: 380px; padding-left:250px; padding-top:20px;">
                     &nbsp;</td></tr>
            </table>
        <asp:Label ID="lblmsg" runat="server" Text="" Font-Bold="True" Font-Size="Large"></asp:Label>
    </div>
</asp:Content>
