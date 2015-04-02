<%@ Page Title="" Language="C#" MasterPageFile="~/FirstMaster.Master" AutoEventWireup="true" CodeBehind="MainPage.aspx.cs" Inherits="EmulationGroupProject.MainPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="lblBoard" runat="server" Font-Bold="true" Font-Names="Arial" Font-Size="Large" Text="Ticket Board"></asp:Label> &nbsp&nbsp 
     <asp:DropDownList ID="ddlTicketStatus" runat="server" Height="28px" Width="89px"></asp:DropDownList> <br /><br />
    <div id="rightSideBar">
        <h2 style="font-size:20px">Details</h2> 
    </div>
    <div style="text-align:center">
        <asp:GridView ID="gvTicket" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Height="196px" Width="716px" AutoGenerateColumns="False">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="TicketID" HeaderText="Ticket No." />
                <asp:BoundField DataField="Summary" HeaderText="Issue/Problem" />
                <asp:BoundField DataField="DateCreated" DataFormatString="{0:d}" HeaderText="Date Created" />
                <asp:BoundField DataField="Priority" HeaderText="Priority" NullDisplayText="-" />
                <asp:BoundField DataField="Status" HeaderText="Status" />
                <asp:BoundField DataField="TicketCategoryID" HeaderText="Category" />
            </Columns>
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
    <br />
    <div>
        <asp:ImageButton ID="imgResponse" ImageUrl="images/response.jpg" runat="server" Height="34px" Width="86px" />
            &nbsp&nbsp
        <asp:ImageButton ID="imgNotes" ImageUrl="images/notes.jpg" runat="server" Height="34px" Width="86px" />
        <br /><br />
        <%--<asp:TextBox ID="txtReponse" Placeholder="Please type your reponse here" TextMode="MultiLine" runat="server" Height="28px" Width="238px"></asp:TextBox>--%>
        <textarea class="txt" type="text"
        value="Some Text Some Text Some Text" /></textarea>
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
        <asp:DataList ID="DataList1" runat="server">
            <ItemTemplate>
                <div>

                </div>
            </ItemTemplate>
        </asp:DataList>
    </div>
 <script type="text/javascript">
     $(function () {
         $(".txt").focus(function () {
             $(this).animate({           
                 width: '200px',
                 height: '40px'
             },
                "fast"
             )
             .animate({
                 width: '720px',
                 height: '130px'

             },
                 "slow"
             );
         });
         $("#chkClosed").show(function () {
             $(this).show({
                 visible: false
             })
         });
         $("#btnPost").show(function () {
             $(this).show({
                 visible: false
             })
         });
     });
     </script>
</asp:Content>
