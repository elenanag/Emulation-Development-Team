<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PrintTicket.aspx.cs" Inherits="TicketingSystem.PrintTicket" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript" src="scripts.js"></script>
    <style type="text/css">
        .auto-style3 {
            width: 186px;
        }
        .auto-style4 {
            width: 133px;
        }
    </style>
</head>
<body>

    <form id="form1" runat="server">
        <center>
    <div >
        <br />
        <br />
        <asp:Label ID="lblTicketInfo" runat="server" Text="TICKET INFORMATION" Font-Bold="True" Font-Size="XLarge"></asp:Label><br />
        <br />
    <table style="text-align:left; height: 278px; width: 465px;">
        <tr><td class="auto-style4">
            <h3>TicketID:</h3>
            </td><td class="auto-style3">
                <asp:Label ID="lblTicketID" runat="server" Text=""></asp:Label>
                 </td></tr>
        <tr><td class="auto-style4">
            <h3>Summary:</h3>
            </td><td class="auto-style3">
                <asp:Label ID="lblSummary" runat="server" Text=""></asp:Label>
                 </td></tr>
        <tr><td class="auto-style4">
            <h3>Description:</h3>
            </td><td class="auto-style3">
                <asp:Label ID="lblDescription" runat="server" Text=""></asp:Label>
                 </td></tr>
        <tr><td class="auto-style4">
            <h3>Priority:</h3>
            </td><td class="auto-style3">
                <asp:Label ID="lblPriority" runat="server" Text=""></asp:Label>
                 </td></tr>
        <tr><td class="auto-style4">
            <h3>Status:</h3>
            </td><td class="auto-style3">
                <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label>
                 </td></tr>
        <tr><td class="auto-style4">
            <h3>Category:</h3>
            </td><td class="auto-style3">
                <asp:Label ID="lblCategory" runat="server" Text=""></asp:Label>
                 </td></tr>
        <tr><td class="auto-style4">
            <h3>Client:</h3>
            </td><td class="auto-style3">
                <asp:Label ID="lblClient" runat="server" Text=""></asp:Label>
                 </td></tr>
        <tr><td class="auto-style4">
            <h3>Client Email:</h3>
            </td><td class="auto-style3">
                <asp:Label ID="lblClientEmail" runat="server" Text=""></asp:Label>
                 </td></tr>
        <tr><td class="auto-style4">
            <h3>Assignee:</h3>
            </td><td class="auto-style3">
                <asp:Label ID="lblAssignee" runat="server" Text=""></asp:Label>
                 </td></tr>
        <tr><td class="auto-style4">
            <h3>Date created:</h3>
            </td><td class="auto-style3">
                <asp:Label ID="lblDateCreated" runat="server" Text=""></asp:Label>
                 </td></tr>
        <tr><td class="auto-style4"></td><td class="auto-style3"><br />
            <asp:ImageButton ID="imgBtnPrint" runat="server" ImageUrl="images/print-button.png" Height="40px" Width="59px" OnClientClick="javascript:window.print();"/>
                     </td></tr>
    </table>
    </div>
     </center>
    </form>
</body>
</html>
