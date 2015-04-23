<%@ Page Title="" Language="C#" MasterPageFile="~/FirstMaster.Master" AutoEventWireup="true" CodeBehind="AdminCategoryPage.aspx.cs" Inherits="TicketingSystem.AdminCategoryPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div style="padding-left:1030px;">
         <asp:LinkButton ID="lbUser" runat="server" Text="Go To Users Page" ForeColor="#CC0000" Font-Bold="True" OnClick="lbUser_Click"></asp:LinkButton>
        </div>
    <div style="text-align:center; ">
    <asp:Label ID="lblCategory" runat="server" Text="Ticket Categories" ForeColor="Black" Font-Size="Large" Font-Bold="True"></asp:Label><br />
        <br />
    </div>
    <center>
    <asp:GridView ID="gvTicketCategory" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="Black" 
                            DataKeyNames="TicketCategoryID" OnRowCommand="gvTicketCategory_RowCommand" Height="164px" Width="638px">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:ButtonField HeaderText="Select" Text="Select" CommandName="SelectCategory">
                <HeaderStyle HorizontalAlign="Center" />
                <ItemStyle ForeColor="#EC3C2D" Font-Bold="True" HorizontalAlign="Center" />
                </asp:ButtonField>
                <asp:BoundField DataField="TicketCategoryID" HeaderText="Category ID" >
                <ItemStyle Font-Bold="True" HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="CategoryName" HeaderText="Name" >
                <ItemStyle Font-Bold="True" HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:ButtonField HeaderText="Delete" CommandName="DeleteCategory" Text="Delete" >
                <HeaderStyle HorizontalAlign="Center" />
                <ItemStyle ForeColor="#EC3C2D" Font-Bold="True" HorizontalAlign="Center" />
                </asp:ButtonField>
                <asp:ButtonField CausesValidation="true" HeaderText="Update" CommandName="UpdateCategory" Text="Update " >
                <HeaderStyle HorizontalAlign="Center" />
                <ItemStyle ForeColor="#EC3C2D" Font-Bold="True" HorizontalAlign="Center" />
                </asp:ButtonField>
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#EC3C2D" Font-Bold="True" ForeColor="White"  />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFF7E7" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
        <asp:Label ID="lblUpdate" runat="server" ForeColor="Black" Text="* To Delete or Update Select a row please!" Font-Bold="True"></asp:Label><br /><br />
        <asp:Label ID="lblTicketCategoryName" runat="server" Text="Ticket Category:" ForeColor="Black"></asp:Label>
        <asp:TextBox ID="txtTicketCategoryName" runat="server" Height="22px" Width="190px"></asp:TextBox>
        <asp:RequiredFieldValidator ValidationGroup="ValidationSummaryCategory" ID="RequiredFieldValidatorTicketCategoryName" runat="server" ControlToValidate="txtTicketCategoryName" Text="*" ErrorMessage="Ticket Category Name Required" ForeColor="Red"></asp:RequiredFieldValidator>
        <asp:Button ValidationGroup="ValidationSummaryCategory" ID="btnAddTicketCategoryName" runat="server" Text="Add Category" Height="25px" Width="134px" Font-Bold="True" 
                               Font-Size="Medium" BackColor="#EC3C2D" ForeColor="#CCCCCC" OnClick="btnAddTicketCategoryName_Click" /><br />
        <asp:Label ID="lblCategoryResult" runat="server" Text="" ForeColor="#EC3C2D" Font-Bold="True"></asp:Label><br/>
         <asp:ValidationSummary ID="ValidationSummaryCategory" runat="server" ForeColor="#EC3C2D" Font-Bold="True"/><br/>
 </center>
</asp:Content>
