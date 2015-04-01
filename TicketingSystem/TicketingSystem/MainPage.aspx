<%@ Page Title="" Language="C#" MasterPageFile="~/FirstMaster.Master" AutoEventWireup="true" CodeBehind="MainPage.aspx.cs" Inherits="EmulationGroupProject.MainPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <asp:Label ID="lblBoard" runat="server" Font-Bold="true" Font-Names="Arial" Font-Size="Large" Text="Ticket Board"></asp:Label> &nbsp&nbsp 
        <asp:DropDownList ID="ddlTicketStatus" runat="server" Height="28px" Width="89px">
        </asp:DropDownList>  <br />
        <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Height="175px" Width="628px">
            <AlternatingRowStyle BackColor="White" />
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <SortedAscendingCellStyle BackColor="#FDF5AC" />
            <SortedAscendingHeaderStyle BackColor="#4D0000" />
            <SortedDescendingCellStyle BackColor="#FCF6C0" />
            <SortedDescendingHeaderStyle BackColor="#820000" />
        </asp:GridView>
    </div>
    <br />
    <div>
        <asp:ImageButton ID="imgResponse" ImageUrl="images/response.jpg" runat="server" Height="34px" Width="86px" />
            &nbsp&nbsp
        <asp:ImageButton ID="imgNotes" ImageUrl="images/notes.jpg" runat="server" Height="34px" Width="86px" />
        <br /><br />
        <asp:TextBox ID="txtReponse" Placeholder="Please type your reponse here" TextMode="MultiLine" runat="server" Height="28px" Width="238px"></asp:TextBox>
    </div>
    <div style="text-align:center">
        <table style="height: 69px; width: 256px">
            <tr>
                <td>
                    <asp:CheckBox ID="chkClosed" Visible="false" Text="Close ticket" runat="server" />
                </td>
                <td>
                     <asp:Button ID="btnPost" runat="server" Visible="false" Text="Post" Height="23px" Width="70px" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
