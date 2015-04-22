<%@ Page Title="" Language="C#" MasterPageFile="~/FirstMaster.Master" AutoEventWireup="true" CodeBehind="MainPage.aspx.cs" enableEventValidation="false" Inherits="EmulationGroupProject.MainPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="padding-left:200px;" >
        <link href="StyleSheet2.css" rel="stylesheet" />
        <table><tr><td>
            <asp:Label ID="lblBoard" runat="server" Font-Bold="true" Font-Names="Arial" Font-Size="XLarge" Text="Ticket Board"></asp:Label> &nbsp&nbsp 
                   </td><td>
                        <asp:DropDownList ID="ddlTicketStatus" runat="server" Height="28px" Width="135px" AutoPostBack="True" OnSelectedIndexChanged="ddlTicketStatus_SelectedIndexChanged"></asp:DropDownList>&nbsp&nbsp
                        </td><td>
                            <asp:Button ID="btnNewTicket" runat="server" Text="New Ticket" Height="28px" Width="100px" Font-Bold="True" OnClick="btnNewTicket_Click" />&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                             </td>
            <td>
            <asp:TextBox ID="txtSearch" runat="server" placeholder="Search Tickets" Height="25px" Width="220px" onkeydown = "return (event.keyCode!=13);"></asp:TextBox>
                   </td><td>
                        <asp:ImageButton ID="ImageButtonSearch" runat="server" src="images/Search.png" Height="26px" Width="32px" OnClick="ImageButtonSearch_Click" />
                        </td></tr></table></div>
         <br /><br />
        <asp:GridView ID="gvTicket" BorderStyle="Solid" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Height="134px" Width="1130px" 
                        AutoGenerateColumns="False" OnRowCommand="gvTicket_RowCommand" DataKeyNames="TicketID" AllowSorting="True"
                        OnSorting="gvTicket_Sorting" AllowPaging="True" OnPageIndexChanging="gvTicket_PageIndexChanging" OnRowDataBound="gvTicket_RowDataBound" PageSize="10" Visible="True">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="TicketID" HeaderText="Ticket No." SortExpression="TicketID" >
                <HeaderStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="Summary" HeaderText="Issue/Problem" >
                <HeaderStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="DateCreated" DataFormatString="{0:d}" HeaderText="Date Created" SortExpression="DateCreated" >
                <HeaderStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="TicketPriorityName" HeaderText="Priority" NullDisplayText="-" >
                <HeaderStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="TicketStatusName" HeaderText="Status" >
                <HeaderStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="Email" HeaderText="Ticket Sender" SortExpression="Email" >
                                    <HeaderStyle HorizontalAlign="Left" />
                </asp:BoundField>
            </Columns>
            <FooterStyle BackColor="#EC3C2D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#EC3C2D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#EC3C2D" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FDF9EE" ForeColor="#333333" />
            <SelectedRowStyle Font-Bold="True" ForeColor="black" />
            <SortedAscendingCellStyle BackColor="#FDF5AC" />
            <SortedAscendingHeaderStyle BackColor="#4D0000" />
            <SortedDescendingCellStyle BackColor="#FCF6C0" />
            <SortedDescendingHeaderStyle BackColor="#820000" />
        </asp:GridView>
    </div>
    <br />
    <div id="ticketOptions">
    
        <asp:DataList ID="dlTicketInfo" OnItemCommand="dlTicketInfo_ItemCommand" runat="server" OnItemDataBound="dlTicketInfo_ItemDataBound" >
            <ItemTemplate>   
            <div style="float:left; width:720px"> 
                <p style="text-align:center;margin:0; color:black">
                    Ticket #  <%#Eval("TicketID")%> :
                <%#Eval("Summary")%>
                    <div><br />
            <table>
                <tr>
                   
</div>
                   <td><a href='EditTicket.aspx?TicketID=<%# Eval("TicketID")%>'><img src="images/edit.jpg" Height="24px" Width="54px" /></a></td>
                    <td><asp:ImageButton ID="ImgBtnClose" ImageUrl="images/Close.jpg" Height="24px" Width="54px" runat="server" OnClientClick="return confirmation();" OnClick="ImgBtnClose_Click" /></td>
                    <%--<td><asp:ImageButton ID="ImgBtnCloseDupelicate" ImageUrl="images/Close as duplicate.jpg" Height="23px" Width="115px" runat="server" /></td>--%>
                    <td><a href='PrintTicket.aspx?TicketID=<%# Eval("TicketID")%>'><img src="images/print.jpg" Height="26px" Width="59px"  /></td>
                </tr>
            </table>
                    </div>
                    <hr />
            <div>
                <h3>Comments:</h3>
                <br />
                <asp:TextBox ID="txtPost" runat="server" TextMode="MultiLine"></asp:TextBox>
            </div>
            <div style="text-align:center">
            <table style="height: 69px; width: 256px">
                <tr>
                    <%--<td>
                        <asp:CheckBox ID="chkClosed" Visible="true" Text="Close ticket" runat="server" />
                    </td>--%>
                    <td>
                         <asp:Button ID="btnPost" CommandName="Post" runat="server" Visible="true" Text="Post" Height="23px" Width="70px" />
                    </td>
                </tr>
            </table>
            </div>
            </div>
        <div style="float:left; padding-left:20px">
        <div id="rightSideBar">
        <table style="text-align:center; width:199px"">
            <tr>
                <td><asp:Button ID="btnHigh" style="border-radius:30px" Width="70px" Height="30px" ForeColor="black" Font-Names="Arial" CommandName="High" BackColor="White" BorderStyle="None" runat="server" Text="High" /></td>
                <td><asp:Button ID="btnMed"  style="border-radius:30px" Width="70px" Height="30px" ForeColor="black" Font-Names="Arial" CommandName="Medium" BackColor="White" BorderStyle="None" runat="server" Text="Medium" /></td>
                <td><asp:Button ID="btnLow"  style="border-radius:30px" Width="70px" Height="30px" ForeColor="black" Font-Names="Arial" CommandName="Low" BackColor="White" BorderStyle="None" runat="server" Text="Low" /></td>
            </tr>
        </table>
            <hr />
        <div>
        <h2 style="font-size:20px">Details</h2>
            <table>
                <tr>
                   <td>Assigned to:</td>
                    <td><asp:Label ID="Label2" runat="server" Text=""></asp:Label></td>
                    <td><asp:DropDownList ID="ddlAssign" OnSelectedIndexChanged="ddlAssign_SelectedIndexChanged" CommandName="dropdown" AutoPostBack="true" Font-Size="Medium" BackColor="#FDF9EE" style="border:0px; outline:0px;" runat="server" >
                        </asp:DropDownList></td>
                </tr>
            </table>
        </div>
            <hr />
        <div>
            <h2 style="font-size:20px">Users</h2> 
            <table>
                <tr>
                     <td>Time spent:</td>
                    <td><asp:Label ID="lblTime" runat="server" Text='<%# String.IsNullOrWhiteSpace(Eval("TimeSpentOnTicket").ToString()) ? "0" : Eval("TimeSpentOnTicket") %>'></asp:Label>
                         <asp:TextBox ID="txtTime" Width="33px" BackColor="White" Visible="false" runat="server"></asp:TextBox> &nbsp minutes
                        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<asp:Button ID="btnAddTime" CommandName="AddTime" runat="server" Text="Add Time" />
                        <asp:Button ID="btnAddIt" runat="server" Visible="false" Text="Add!" />
                    </td>
                </tr>
                <tr>
                    <td>Client name:</td>
                    <td><asp:Label ID="lblClientName" Font-Bold="true" runat="server" Text=""></asp:Label></td>
                </tr>
            </table>
        </div>
            <hr />
        </div>
        </div>
        </ItemTemplate>
        </asp:DataList>
    </div>
 
    <div style ="padding-left:750px;">
     <asp:DataList ID="dlImage" runat="server" RepeatColumns="5" Visible="False" >
        <ItemTemplate>
            <h4>Image:</h4>
             <a href='<%# Eval("ImagePath") %>' class="group1" rel="grouped">
             <asp:Image ID="imagelightbox" runat="server" ImageUrl='<%# Eval("ImagePath") %>' Width="50" Height="30" />
            </a> 
     </ItemTemplate>    
    </asp:DataList>
     <asp:DataList ID="dlAttachments" runat="server" RepeatColumns="1" Visible="False" >
        <ItemTemplate>
            <h3>Attachment:</h3> <br/>
             <a href='<%# Eval("ImagePath") %>' ><%# Eval("ImagePath") %></a><br/><br/>
              <br />    
     </ItemTemplate>    
    </asp:DataList>
    </div>
    
    <asp:Panel ID="panelActivity" Visible="false" runat="server">
    <div style="width:650px" class="Scroll">
        <h2>Activity</h2>
        <br />
        <asp:Repeater ID="Repeater1" runat="server">
            <ItemTemplate>
                <asp:Label ID="lblComment" runat="server" Text='<%# Eval("Comments") %>'></asp:Label>
                <br />
                <asp:Label ID="lblDateAndTime" Font-Size="Small" ForeColor="Gray" runat="server" Text='<%# Eval("DateOfComments") %>'></asp:Label>
                <asp:Label ID="lblClientName" Font-Bold="true" Font-Size="Small" ForeColor="Gray" runat="server" Text='<%# "by " + Eval("FirstName") + " " + Eval("LastName") %>'></asp:Label>
                <hr />
            </ItemTemplate>
        </asp:Repeater>
    </div>
    </asp:Panel>
    
 <script type="text/javascript">

     $(function () {
         $("#ContentPlaceHolder1_chkClosed, label[for='ContentPlaceHolder1_chkClosed']").hide();
         $("#ContentPlaceHolder1_btnPost").hide();

         $("#ContentPlaceHolder1_dlTicketInfo_txtPost_0").focus(function () {
             $(this).animate({           
                 width: '200px',
                 height: '40px'
             },
                "fast"
             )
             .animate({
                 width: '600px',
                 height: '130px'
                      },
                "slow");
             $("#ContentPlaceHolder1_chkClosed, label[for='ContentPlaceHolder1_chkClosed']").show();

             $("#ContentPlaceHolder1_btnPost").show();
         });
        
      $("body").removeClass("RobertsonBackground");
     });

     $(document).ready(function () {
         $("a.group1").fancybox();
     });

     function confirmation() {
         alert("The ticket was closed!")   
     }

     $('html, body').animate({
         scrollTop: $("#ContentPlaceHolder1_dlTicketInfo").offset().top
     }, 1000);
     </script>

</asp:Content>
