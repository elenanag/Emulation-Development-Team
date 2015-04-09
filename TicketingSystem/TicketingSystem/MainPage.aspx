<%@ Page Title="" Language="C#" MasterPageFile="~/FirstMaster.Master" AutoEventWireup="true" CodeBehind="MainPage.aspx.cs" enableEventValidation="false" Inherits="EmulationGroupProject.MainPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="text-align:center" >
        <link href="StyleSheet2.css" rel="stylesheet" />
        <asp:Label ID="lblBoard" runat="server" Font-Bold="true" Font-Names="Arial" Font-Size="Large" Text="Ticket Board"></asp:Label> &nbsp&nbsp 
        <asp:DropDownList ID="ddlTicketStatus" runat="server" Height="28px" Width="135px" AutoPostBack="True" OnSelectedIndexChanged="ddlTicketStatus_SelectedIndexChanged"></asp:DropDownList>&nbsp&nbsp
        <asp:Button ID="btnNewTicket" runat="server" Text="New Ticket" Height="28px" Width="100px" Font-Bold="True" OnClick="btnNewTicket_Click" />
         <br /><br />
        <asp:GridView ID="gvTicket" BorderStyle="Solid" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Height="134px" Width="1130px" 
                        AutoGenerateColumns="False" OnRowCommand="gvTicket_RowCommand" DataKeyNames="TicketID" AllowSorting="True"
                        OnSorting="gvTicket_Sorting" AllowPaging="True" OnPageIndexChanging="gvTicket_PageIndexChanging" OnRowDataBound="gvTicket_RowDataBound" PageSize="5">
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
    <br /><br />
    <div id="ticketOptions">
        <asp:DataList ID="dlTicketInfo" runat="server" >
            <ItemTemplate>   
            <div style="float:left; width:720px"> 
                <p style="text-align:center;margin:0;padding-bottom:10px; padding-right:50px; color:black">
                Ticket # <%# Eval("TicketID")%> : 
                <%#Eval("Summary")%>
                    <div><br />
            <table border="1">
                <tr>
                    <td><a href = "javascript:void(0)" onclick = "document.getElementById('light').style.display='block';
                        document.getElementById('fade').style.display='block'"><img src="images/edit.jpg"  Height="26px" Width="65px"/></a>
                            <div id="light" class="white_content">
            <table cellpadding=0 cellspacing=0  style="background-color:red;"  width="100%" ><tr><td height="16px" >
                             <a href = "javascript:void(0)" 
                             onclick = "document.getElementById('light').style.display='none';
                             document.getElementById('fade').style.display='none'">
                             <img src="close.gif" style="border :0px"  width="13px" align="right" height="13px"/></a></td></tr>
                    <tr><td style="padding-left:16px;padding-right:16px;padding-bottom:16px"> 
            <table align="center"  border="0" cellpadding="0" cellspacing="0" style="background-color:#fff" width="100%">
                    <tr>
                    <td align="center" colspan="2" class="headertext" style="padding-top:20px;">Edit Ticket </td>
                    </tr>
                    <tr><td>&nbsp;</td></tr>
                    <tr><td align="center"> 
                    <table><tr>
                    <td align="right">Summary</td><td><asp:TextBox ID="txtSummary" runat="server" CssClass="textfield"></asp:TextBox>
                    </td>
                    </tr>
                    <tr><td height="10px"></td></tr>
                    <tr>
                    <td align="right">Description</td>
                    <td><asp:TextBox ID="txtDesc" runat="server" CssClass="textfield" TextMode="MultiLine"></asp:TextBox></td>
                    </tr>
                    <tr><td height="10px"></td></tr>
                    <tr><td align="right">Priority</td>
                    <td>
                        <asp:DropDownList ID="DdlPriority" runat="server"></asp:DropDownList></td>
                    </tr>
                    <tr><td height="10px"></td></tr>
                    <tr><td align="right">Status</td>
                    <td> <asp:DropDownList ID="DdlStatus" runat="server"></asp:DropDownList></td>
                    </tr>
                    <tr><td height="10px"></td></tr>
                    <tr><td align="right">Assignee</td>
                    <td>
                        <asp:DropDownList ID="DdlAssignee" runat="server"></asp:DropDownList></td>
                    </tr>
                    <tr><td height="10px"></td></tr>
                    <tr><td align="right"> Category</td>
                    <td>
                        <asp:DropDownList ID="DdlTicketCategory" runat="server"></asp:DropDownList></td>
                    </tr>
                    <tr><td height="10px"></td></tr>
                    <tr>
                    <td> </td><td><asp:Button ID="btnEdit" runat="server" Text="Edit" class="button2" Height="27px"/>
                    </td>
                    </tr></table></td></tr>
                    <tr><td height="10px"></td></tr>
                    </table>
                    </td></tr>
                    </table>
                    <div align="center" class=" headertext">
                    <asp:Label ID="txtlbl" runat="server"  ></asp:Label></div>
                    </div>

 <%--<asp:ImageButton ID="ImgBtnEdit" ImageUrl="images/edit.jpg" Height="26px" Width="65px" runat="server" />--%></td>
                    <td><asp:ImageButton ID="ImgBtnClose" ImageUrl="images/Close.jpg" Height="24px" Width="54px" runat="server" /></td>
                    <td><asp:ImageButton ID="ImgBtnCloseDupelicate" ImageUrl="images/Close as duplicate.jpg" Height="23px" Width="115px" runat="server" /></td>
                    <td><asp:ImageButton ID="ImgBtnPrint" ImageUrl="images/print.jpg" Height="26px" Width="59px" runat="server" /></td>
                </tr>
            </table>
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
            </div>
            </div>
        <div style="float:left; padding-left:20px">
        <div id="rightSideBar">
        <table style="text-align:center; width:199px"">
            <tr>
                <td><asp:Button ID="btnHigh" BackColor="#FDF9EE" BorderStyle="None" runat="server" Text="High" /></td>
                <td><asp:Button ID="btnMed"  BackColor="#FDF9EE" BorderStyle="None" runat="server" Text="Medium" /></td>
                <td><asp:Button ID="btnLow"  BackColor="#FDF9EE" BorderStyle="None" runat="server" Text="Low" /></td>
            </tr>
        </table>
            <hr />
        <div>
        <h2 style="font-size:20px">Details</h2>
            <table>
                <tr>
                    <td>Date created:</td>
                    <td><asp:Label ID="lblDate" runat="server" Text=""></asp:Label></td>
                </tr>
                <tr>
                    <td>Time spent:</td>
                    <td><asp:Label ID="Label1" runat="server" Text=""></asp:Label></td>
                </tr>
            </table>
        </div>
            <hr />
        <div>
            <h2 style="font-size:20px">Users</h2> 
            <table>
                <tr>
                    <td>Assigned to:</td>
                    <td><asp:Label ID="Label2" runat="server" Text=""></asp:Label></td>
                    <td><asp:DropDownList ID="ddlAssign" Font-Size="X-Small" BackColor="#FDF9EE" style="border:0px; outline:0px;" runat="server">
                        <asp:ListItem>assign to</asp:ListItem>
                        </asp:DropDownList></td>
                </tr>
                <tr>
                    <td>Client name:</td>
                    <td><asp:Label ID="Label3" runat="server" Text=""></asp:Label></td>
                </tr>
            </table>
        </div>
            <hr />
        </div>
        </div>
        </ItemTemplate>

        </asp:DataList>
    </div>

        
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
    

     </script>
</asp:Content>
