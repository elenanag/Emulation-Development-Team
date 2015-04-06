<%@ Page Title="" Language="C#" MasterPageFile="~/FirstMaster.Master" AutoEventWireup="true" CodeBehind="MainPage.aspx.cs" Inherits="EmulationGroupProject.MainPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="rightSideBar">
        <h2 style="font-size:20px">Details</h2> 
    </div>
    <div style="text-align:center" >
        <asp:Label ID="lblBoard" runat="server" Font-Bold="true" Font-Names="Arial" Font-Size="Large" Text="Ticket Board"></asp:Label> &nbsp&nbsp 
        <asp:DropDownList ID="ddlTicketStatus" runat="server" Height="28px" Width="105px" AutoPostBack="True" OnSelectedIndexChanged="ddlTicketStatus_SelectedIndexChanged"></asp:DropDownList> <br /><br />
        <asp:GridView ID="gvTicket" BorderStyle="Solid" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Height="134px" Width="812px" 
                        AutoGenerateColumns="False" OnRowCommand="gvTicket_RowCommand" DataKeyNames="TicketID" AllowSorting="True"
                        OnSorting="gvTicket_Sorting" AllowPaging="True" OnPageIndexChanging="gvTicket_PageIndexChanging">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:ButtonField CommandName="SelectTicket" HeaderText="Select" Text="Select">
                <ItemStyle ForeColor="#EC3C2D" />
                </asp:ButtonField>
                <asp:BoundField DataField="TicketID" HeaderText="Ticket No." SortExpression="TicketID" />
                <asp:BoundField DataField="Summary" HeaderText="Issue/Problem" />
                <asp:BoundField DataField="DateCreated" DataFormatString="{0:d}" HeaderText="Date Created" SortExpression="DateCreated" />
                <asp:BoundField DataField="TicketPriorityName" HeaderText="Priority" NullDisplayText="-" />
                <asp:BoundField DataField="TicketStatusName" HeaderText="Status" />
                <asp:BoundField DataField="Email" HeaderText="Ticket Sender" SortExpression="Email" />
            </Columns>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#EC3C2D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <SelectedRowStyle BackColor="lightgray" Font-Bold="True" ForeColor="#EC3C2D" />
            <SortedAscendingCellStyle BackColor="#FDF5AC" />
            <SortedAscendingHeaderStyle BackColor="#4D0000" />
            <SortedDescendingCellStyle BackColor="#FCF6C0" />
            <SortedDescendingHeaderStyle BackColor="#820000" />
        </asp:GridView>
    </div>
    <br /><br />
    <div id ="ticketOptions" >
        <%--Ticket #<asp:Label ID="lblTicketNumber" runat="server" Text=""></asp:Label>--%>
        <asp:DataList ID="dlTicketInfo" runat="server">
            <ItemTemplate>    
                <p style="text-align:center;margin:0;padding-bottom:10px; padding-right:50px; color:black">
                Ticket # <%# Eval("TicketID")%> : 
                <%#Eval("Summary")%>
                 </ItemTemplate>
        </asp:DataList>
        <br /><Br />
        <div>
            <table border="1">
                <tr>
                    <td> <asp:ImageButton ID="ImgBtnEdit" ImageUrl="images/edit.jpg" Height="26px" Width="65px" runat="server" /></td>
                    <td><asp:ImageButton ID="ImgBtnClose" ImageUrl="images/Close.jpg" Height="24px" Width="54px" runat="server" /></td>
                    <td><asp:ImageButton ID="ImgBtnCloseDupelicate" ImageUrl="images/Close as duplicate.jpg" Height="23px" Width="115px" runat="server" /></td>
                    <td><asp:ImageButton ID="ImgBtnPrint" ImageUrl="images/print.jpg" Height="26px" Width="59px" runat="server" /></td>
                </tr>
            </table>
        </div>
    </div>
    <br /><br />
    <div>
        <asp:ImageButton ID="imgResponse" ImageUrl="images/response.jpg" runat="server" Height="34px" Width="86px" />
            &nbsp&nbsp
        <asp:ImageButton ID="imgNotes" ImageUrl="images/notes.jpg" runat="server" Height="34px" Width="86px" />
        <br /><br />
        <asp:TextBox ID="txtPost" runat="server" TextMode="MultiLine"></asp:TextBox>
    </div>
    <div style="text-align:center">
        <table style="height: 69px; width: 256px">
            <tr>
                <td>
                    <asp:CheckBox ID="chkClosed" Visible="true" Text="Close ticket" runat="server" />
                </td>
                <td>
                     <asp:Button ID="btnPost" runat="server" Visible="true" Text="Post" Height="23px" Width="70px" />
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
         $("#ContentPlaceHolder1_chkClosed, label[for='ContentPlaceHolder1_chkClosed']").hide();
         $("#ContentPlaceHolder1_btnPost").hide();

         $("#ContentPlaceHolder1_txtPost").focus(function () {
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
                "slow");
             $("#ContentPlaceHolder1_chkClosed, label[for='ContentPlaceHolder1_chkClosed']").show();

             $("#ContentPlaceHolder1_btnPost").show();
         });
         
     });
     </script>
</asp:Content>
