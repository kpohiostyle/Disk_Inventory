<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="borrower.aspx.cs" Inherits="ProjectWeek2.borrower" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!--Created Kevin Powell-->
    <!--Edited 11/15/2019-->
    <h1 class="h1Borrower">Current Borrowers</h1>
    <asp:GridView ID="grdBorrower" runat="server" 
        AutoGenerateColumns="False" DataKeyNames="borrower_id" AutoPostBack="True" 
        DataSourceID="SqlDataSource1"  CssClass="table table-bordered table-striped table-condensed"
         OnRowDeleted="grdBorrower_RowDeleted" 
         OnRowUpdated="grdBorrower_RowUpdated">
        <Columns>
            <asp:TemplateField HeaderText="BorrowerID" InsertVisible="False" SortExpression="borrower_id">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("borrower_id") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("borrower_id") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="First Name" SortExpression="borrower_first_name">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("borrower_first_name") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox1" Display="Dynamic" ErrorMessage="*" ValidationGroup="Edit" SetFocusOnError="False"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("borrower_first_name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Last Name" SortExpression="borrower_last_name">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("borrower_last_name") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox2" Display="Dynamic" ErrorMessage="*" ValidationGroup="Edit"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("borrower_last_name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Phone Number" SortExpression="phone_number">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("phone_number") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox3" Display="Dynamic" 
                        ErrorMessage="*" ValidationGroup="Edit"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox3" Display="Dynamic"
                        ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}" ErrorMessage="Please use format 999-999-9999"></asp:RegularExpressionValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("phone_number") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField CausesValidation ="True" ShowEditButton="True" ValidationGroup="Edit" />
            <asp:CommandField CausesValidation="False" ShowDeleteButton="True" ValidationGroup="Edit" />
        </Columns>
</asp:GridView>
   

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:disk_inventoryKPConnectionString %>" 
        DeleteCommand="sp_deleteBorrower" 
        InsertCommand="sp_InsertBorrower" 
        SelectCommand="SELECT [borrower_id], [borrower_first_name], [borrower_last_name], [phone_number] FROM [Borrower] ORDER BY [borrower_last_name], [borrower_first_name]" 
        UpdateCommand="sp_UpdateBorrower" DeleteCommandType="StoredProcedure" InsertCommandType="StoredProcedure" UpdateCommandType="StoredProcedure">
        <DeleteParameters>
            <asp:Parameter Name="borrower_id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="borrower_first_name" Type="String" />
            <asp:Parameter Name="borrower_last_name" Type="String" />
            <asp:Parameter Name="phone_number" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="borrower_id" Type="Int32" />
            <asp:Parameter Name="borrower_first_name" Type="String" />
            <asp:Parameter Name="borrower_last_name" Type="String" />
            <asp:Parameter Name="phone_number" Type="String" />
        </UpdateParameters>
</asp:SqlDataSource>
    <asp:Label ID="Label5" runat="server" EnableViewState="False"></asp:Label>
   <asp:Label ID="Label4" runat="server"><h4>Enter information below to add new borrower</h4></asp:Label>
    <div class="form-group">
        <asp:Label ID="Label1" runat="server" Text="First Name"></asp:Label>
        <asp:TextBox ID="borrowerFName" runat="server" CssClass="form-control"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="borrowerFName" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
    </div>

    <div class="form-group">
        <asp:Label ID="Label2" runat="server" Text="Last Name"></asp:Label>
        <asp:TextBox ID="borrowerLName" runat="server" CssClass="form-control"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="borrowerLName" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
   </div>
   <div class="form-group">
        <asp:Label ID="Label3" runat="server" Text="Phone Number"></asp:Label>
        <asp:TextBox ID="borrowerPNumber" runat="server" CssClass="form-control"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" Display="Dynamic" ControlToValidate="borrowerPNumber"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
        ControlToValidate="borrowerPNumber" ErrorMessage="Please Use Format 999-999-9999" 
        ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}"></asp:RegularExpressionValidator>
   </div>

        <div class="form-group">
        <asp:Button ID="btn_Submit" runat="server" CssClass="btn btn-outline-secondary" Text="Submit" OnClick="btn_Submit_Click" />
   </div>
   
</asp:Content>
