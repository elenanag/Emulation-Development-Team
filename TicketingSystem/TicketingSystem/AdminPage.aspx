<%@ Page Title="" Language="C#" MasterPageFile="~/FirstMaster.Master" AutoEventWireup="true" CodeBehind="AdminPage.aspx.cs" Inherits="TicketingSystem.AdminPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div style="padding-left:1030px;"><asp:LinkButton ID="lbTicketCategory" runat="server" Text="Go To Ticket Category" ForeColor="#CC0000" Font-Bold="True" OnClick="lbTicketCategory_Click"></asp:LinkButton></div>
    <div style="text-align:center; ">
    <asp:Label ID="lblUsers" runat="server" Text="Users" ForeColor="Black" Font-Size="Large" Font-Bold="True"></asp:Label><br />
        <br />
    </div>
    <asp:GridView ID="gvUsers" runat="server" AutoGenerateColumns="False" AllowSorting="True" OnSorting="gvUsers_Sorting" OnPageIndexChanging="gvUsers_PageIndexChanging" OnRowCommand="gvUsers_RowCommand"
                AllowPaging="True" DataKeyNames="UserID" Font-Bold="True" FooterStyle-BackColor="White" HeaderStyle-BackColor="White" BackColor="#DEBA84" BorderColor="#DEBA84" 
                GridLines="Horizontal"  BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" Width="1200px" Height="270px">
            <Columns>
                <asp:ButtonField HeaderText="Select" Text="Select" CommandName="SelectUser">
<HeaderStyle ForeColor="White"></HeaderStyle>
                <ItemStyle ForeColor="Red" />
                </asp:ButtonField>
                <asp:BoundField DataField="UserID" HeaderText="User ID" SortExpression="UserID" >
<HeaderStyle ForeColor="White"></HeaderStyle>
                <ItemStyle ForeColor="Black" HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="FirstName" HeaderText="First Name" SortExpression="FirstName" >
<HeaderStyle ForeColor="White"></HeaderStyle>
                <ItemStyle ForeColor="Black" />
                </asp:BoundField>
                <asp:BoundField DataField="LastName" HeaderText="Last Name" SortExpression="LastName" >
<HeaderStyle ForeColor="White"></HeaderStyle>
                <ItemStyle ForeColor="Black" />
                </asp:BoundField>
                <asp:BoundField DataField="Title" HeaderText="Title">
                <ItemStyle ForeColor="Black" />
                </asp:BoundField>
                <asp:BoundField DataField="Phone" HeaderText="Phone" >
<HeaderStyle ForeColor="White"></HeaderStyle>
                <ItemStyle ForeColor="Black" />
                </asp:BoundField>
                <asp:BoundField DataField="Email" HeaderText="Email" >
<HeaderStyle ForeColor="White"></HeaderStyle>
                <ItemStyle ForeColor="Black" />
                </asp:BoundField>
                <asp:BoundField DataField="Password" HeaderText="Password" >
<HeaderStyle ForeColor="White"></HeaderStyle>
                <ItemStyle ForeColor="Black" />
                </asp:BoundField>
                <asp:BoundField DataField="AccessLevelID" HeaderText="Access ID" >
                <ItemStyle ForeColor="Black" HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:ButtonField HeaderText="Update" CausesValidation="true" ValidationGroup="CustomerGroup" ShowHeader="True" CommandName="UpdateUser" Text="Update " >
<HeaderStyle ForeColor="White"></HeaderStyle>
                <ItemStyle ForeColor="Red" />
                </asp:ButtonField>
                <asp:ButtonField HeaderText="Delete " ShowHeader="True" CommandName="DeleteUser" Text="Delete " >
<HeaderStyle ForeColor="White"></HeaderStyle>
                <ItemStyle ForeColor="Red" />
                </asp:ButtonField>
            </Columns>

<FooterStyle BackColor="Red" ForeColor="White"></FooterStyle>

<HeaderStyle BackColor="Red" Font-Bold="True" ForeColor="White"></HeaderStyle>
                <PagerStyle ForeColor="White" BackColor="Red" HorizontalAlign="Center" />
                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                <SortedAscendingCellStyle BackColor="#FFF1D4" />
                <SortedAscendingHeaderStyle BackColor="#B95C30" />
                <SortedDescendingCellStyle BackColor="#F1E5CE" />
                <SortedDescendingHeaderStyle BackColor="#93451F" />
        </asp:GridView>

    <div style="text-align:center">
         <asp:Label ID="lblUpdate" runat="server" ForeColor="Black" Text="* To Delete or Update Select a row please!" Font-Bold="True"></asp:Label><br />
        <br />
            <asp:Label ID="lblFirstName" runat="server" Text="FirstName:" ForeColor="Black"></asp:Label>
            <asp:TextBox ID="txtFirstName" runat="server" Width="110px"></asp:TextBox>
            <asp:RequiredFieldValidator ValidationGroup="UserGroup" ID="RequiredFieldValidatorFirstName" runat="server" ControlToValidate="txtFirstName" Text="*" ErrorMessage="First Name Required" ForeColor="#990033"></asp:RequiredFieldValidator>
            <asp:Label ID="lblLastName" runat="server" Text="LastName:" ForeColor="Black"></asp:Label>
            <asp:TextBox ID="txtLastName" runat="server" Width="110px"></asp:TextBox>
            <asp:RequiredFieldValidator ValidationGroup="UserGroup" ID="RequiredFieldValidatorLastName" runat="server" ControlToValidate="txtLastName" ErrorMessage="Last Name Required" Text="*" ForeColor="#990033"></asp:RequiredFieldValidator>
            <asp:Label ID="lblTitle" runat="server" Text="Title:" ForeColor="Black"></asp:Label>
            <asp:TextBox ID="txtTitle" runat="server" Width="95px"></asp:TextBox>
            <asp:RequiredFieldValidator ValidationGroup="UserGroup" ID="RequiredFieldValidatorTitle" runat="server" ControlToValidate="txtTitle" ErrorMessage="Title Required" Text="*" ForeColor="#990033"></asp:RequiredFieldValidator>
            <asp:Label ID="lblPhone" runat="server" Text="Phone:" ForeColor="Black"></asp:Label>
            <asp:TextBox ID="txtPhone" runat="server" Width="130px"></asp:TextBox>
            <asp:RequiredFieldValidator ValidationGroup="UserGroup" ID="RequiredFieldValidatorPhone" runat="server" ControlToValidate="txtPhone" ErrorMessage="Phone Required" Text="*" ForeColor="#990033"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ValidationGroup="UserGroup" ID="RegularExpressionValidatorPhone" ControlToValidate="txtPhone" runat="server" Text="*" ValidationExpression="(^x\s*[0-9]{5}$)|(^(\([1-9][0-9]{2}\)\s)?[1-9][0-9]{2}-[0-9]{4}(\sx\s*[0-9]{5})?$)" ErrorMessage="Must be numbers in form: (XXX) XXX-XXXX"  ForeColor="#990033"></asp:RegularExpressionValidator>
            <asp:Label ID="lblEmail" runat="server" Text="Email:" ForeColor="Black"></asp:Label>
            <asp:TextBox ID="txtEmail" runat="server" Width="195px"></asp:TextBox>
            <asp:RequiredFieldValidator ValidationGroup="UserGroup" ID="RequiredFieldValidatorEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email Required" Text="*" ForeColor="#990033"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ValidationGroup="UserGroup" ID="RegularExpressionValidatorEmail" ControlToValidate="txtEmail" Text="*" ErrorMessage="E-mail format: text@site.ca" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" runat="server" ForeColor="#990033" Font-Size="Small"></asp:RegularExpressionValidator><br/><br/>
            <asp:Label ID="lblPassword" runat="server" Text="Password:" ForeColor="Black"></asp:Label>
            <asp:TextBox ID="txtPassword" runat="server" Width="95px"></asp:TextBox>
            <asp:RequiredFieldValidator ValidationGroup="UserGroup" ID="RequiredFieldValidatorPassword" runat="server" ControlToValidate="txtPassword" ErrorMessage="Password Required" Text="*" ForeColor="#990033"></asp:RequiredFieldValidator>
            <asp:Label ID="lblAccessLevelID" runat="server" Text="Access Level ID:" ForeColor="Black"></asp:Label>
            <asp:TextBox ID="txtAccessLevelID" runat="server" Width="95px"></asp:TextBox>
            <asp:RequiredFieldValidator ValidationGroup="UserGroup" ID="RequiredFieldValidatorAccessLevelID" runat="server" ControlToValidate="txtAccessLevelID" ErrorMessage="Access Level ID Required" Text="*" ForeColor="#990033"></asp:RequiredFieldValidator>
            
        <br/><br/>
              <asp:Button ValidationGroup="UserGroup" ID="btnAddUser" runat="server" Text="Add User" Height="27px" Width="130px" Font-Bold="True" 
                               Font-Size="Medium" BackColor="Red" ForeColor="#CCCCCC" OnClick="btnAddUser_Click" /><br/>
        <br />
             <asp:Label ID="lblResult" runat="server" Text="" ForeColor="Red" Font-Bold="True"></asp:Label>
        <asp:ValidationSummary ValidationGroup="UserGroup" ID="ValidationSummary" runat="server" ForeColor="Red" Font-Bold="True"/>
      </div>
</asp:Content>
