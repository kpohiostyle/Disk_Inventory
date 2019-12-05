<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="checkout.aspx.cs" Inherits="ProjectWeek4.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
        
        <h1 class="h1Borrower">Disk Check Out</h1>
   <!--Drop down for disk -->
        Select a Disk:
    <div class="form-group">
        <asp:DropDownList ID="ddlDisk" runat="server" CssClass="form-control" DataSourceID="SqlDataSource1" DataTextField="cd_name" DataValueField="cd_id"></asp:DropDownList> 
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:disk_inventoryKPConnectionString %>" SelectCommand="SELECT [cd_name], [cd_id] FROM [CompactDisk] WHERE ([status_id] = @status_id) ORDER BY [cd_name]">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlDisk" DefaultValue="2" Name="status_id" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
   </div>
       
   <!--Drop down for Borrower -->
        Select a Borrower:
    <div class="form-group">
        <asp:DropDownList ID="ddlBorrower" runat="server" DataSourceID="SqlDataSource2" CssClass="form-control"
            DataTextField="borrower_last_name" DataValueField="borrower_id">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:disk_inventoryKPConnectionString %>" 
            SelectCommand="SELECT [borrower_last_name], [borrower_id] FROM [Borrower] ORDER BY [borrower_last_name]"></asp:SqlDataSource>
    </div>
    <!--Text box for date selector -->
        Select a Checkout Date:
    <div class="form-group">
        <asp:TextBox ID="txtDate" runat="server" TextMode="Date"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please select a date" ControlToValidate="txtDate"></asp:RequiredFieldValidator>
   </div>
       <div class="form-group">
            <asp:Button ID="btn_Submit" runat="server" CssClass="btn btn-outline-secondary" Text="Submit" OnClick="btn_Submit_Click" />
       </div>
   
        <asp:Label ID="Label1" runat="server"></asp:Label>
    
</asp:Content>
