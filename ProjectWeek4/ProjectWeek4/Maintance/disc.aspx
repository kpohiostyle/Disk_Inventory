<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="disc.aspx.cs" Inherits="ProjectWeek4.disc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
  
    <h1 class="h1Borrower">Current Disks</h1>

  
    <asp:GridView ID="grdDisk" runat="server" AutoGenerateColumns="False" DataKeyNames="cd_id" 
        CssClass="table table-bordered table-striped table-condensed" 
        DataSourceID="SqlDataSource1"
         OnRowDeleted="grdDisk_RowDeleted" 
        OnRowUpdated="grdDisk_RowUpdated">
        <Columns>
            <asp:TemplateField HeaderText="DiskID" InsertVisible="False" SortExpression="cd_id">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("cd_id") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("cd_id") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Disk Name" SortExpression="cd_name">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("cd_name") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Display="Dynamic" ErrorMessage="*" 
                        ControlToValidate="TextBox1" ValidationGroup="Edit"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("cd_name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Release Date" SortExpression="release_date">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("release_date") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" 
                        ControlToValidate="TextBox2" ValidationGroup="Edit"></asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="RangeValidator" ControlToValidate="TextBox2" Display="Dynamic" Type="Date" ValidationGroup="Edit" MaximumValue="12/31/9999" MinimumValue="01/01/0001"></asp:RangeValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("release_date") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Status" SortExpression="status_id">
                <EditItemTemplate>
                   <asp:DropDownList ID="ddlStatus" runat="server" DataSourceID="SqlDataSource2" DataTextField="status_description" DataValueField="status_id" Text='<%# Bind("status_id") %>' CssClass="form-control"></asp:DropDownList>
                   <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:disk_inventoryKPConnectionString %>" SelectCommand="SELECT [status_id], [status_description] FROM [DiskStatus]"></asp:SqlDataSource>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("status_id") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Disk Type" SortExpression="diskType_id">
                <EditItemTemplate>
                   <asp:DropDownList ID="ddlType" runat="server" DataSourceID="SqlDataSource3" DataTextField="diskType_description" DataValueField="diskType_id" Text='<%# Bind("diskType_id") %>' CssClass="form-control"></asp:DropDownList>   
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:disk_inventoryKPConnectionString %>" SelectCommand="SELECT [diskType_id], [diskType_description] FROM [DiskType]"></asp:SqlDataSource>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("diskType_id") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Genre" SortExpression="genre_id">
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlGenre" runat="server" DataSourceID="SqlDataSource4" DataTextField="genre_description" DataValueField="genre_id" Text='<%# Bind("genre_id") %>'  CssClass="form-control"></asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:disk_inventoryKPConnectionString %>" SelectCommand="SELECT [genre_id], [genre_description] FROM [Genre]"></asp:SqlDataSource>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("genre_id") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField CausesValidation="True" ShowEditButton="True" ValidationGroup="Edit" />
            <asp:CommandField CausesValidation="False" ShowDeleteButton="True" ValidationGroup="Edit" />
        </Columns>
    </asp:GridView>
   
        
    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:disk_inventoryKPConnectionString %>" 
        DeleteCommand="sp_deleteDisk" 
        InsertCommand="sp_insertDisk" 
        SelectCommand="SELECT [cd_id], [cd_name], convert(varchar(10), release_date, 120) as release_date, [status_id], [diskType_id], [genre_id] FROM [CompactDisk] ORDER BY [cd_name]" 
        UpdateCommand="sp_updateDisk" DeleteCommandType="StoredProcedure" InsertCommandType="StoredProcedure" UpdateCommandType="StoredProcedure">
        <DeleteParameters>
            <asp:Parameter Name="cd_id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="cd_name" Type="String" />
            <asp:Parameter DbType="Date" Name="release_date" />
            <asp:Parameter Name="status_id" Type="Int32" />
            <asp:Parameter Name="diskType_id" Type="Int32" />
            <asp:Parameter Name="genre_id" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="cd_id" Type="Int32" />
            <asp:Parameter Name="cd_name" Type="String" />
            <asp:Parameter DbType="Date" Name="release_date" />
            <asp:Parameter Name="status_id" Type="Int32" />
            <asp:Parameter Name="diskType_id" Type="Int32" />
            <asp:Parameter Name="genre_id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

   <asp:Label ID="Label5" runat="server" EnableViewState="False"></asp:Label>
     <asp:Label ID="Label4" runat="server"><h4>Enter information below to add new artist</h4></asp:Label>

    <!--tags for disk name-->
    <div class="form-group">
        <asp:Label ID="Label1" runat="server" Text="CD Name"></asp:Label>
        <asp:TextBox ID="cdName" runat="server" CssClass="form-control"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="cdName" ErrorMessage="*"></asp:RequiredFieldValidator>
    </div>

    <!-- tags for release date-->
    <div class="form-group">
        <asp:Label ID="Label2" runat="server" Text="Release Date"></asp:Label>
        <asp:TextBox ID="releaseDate" runat="server" CssClass="form-control"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" Display="Dynamic" ControlToValidate="releaseDate"></asp:RequiredFieldValidator>
        <asp:RangeValidator ID="RangeValidator2" runat="server" ErrorMessage="Use format 99/99/9999 and use valid date" ControlToValidate="releaseDate" MaximumValue="12/31/9999" Type="Date" MinimumValue="01/01/0001"></asp:RangeValidator>
   </div>

    <!-- drop down list for status-->
    <div class="form-group">
        <asp:Label ID="Label3" runat="server" Text="Status"></asp:Label>
        <asp:DropDownList ID="ddlStatus" runat="server" DataSourceID="SqlDataSource2" DataTextField="status_description" DataValueField="status_id" Display="Dynamic" CssClass="form-control"></asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:disk_inventoryKPConnectionString %>" SelectCommand="SELECT [status_id], [status_description] FROM [DiskStatus]"></asp:SqlDataSource>
   </div>

    <!-- drop down list for type-->
    <div class="form-group">
        <asp:Label ID="Label6" runat="server" Text="Type"></asp:Label>
        <asp:DropDownList ID="ddlType" runat="server" DataSourceID="SqlDataSource3" DataTextField="diskType_description" DataValueField="diskType_id" CssClass="form-control"></asp:DropDownList>   
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:disk_inventoryKPConnectionString %>" SelectCommand="SELECT [diskType_id], [diskType_description] FROM [DiskType]"></asp:SqlDataSource>
   </div>

    <!-- drop down list for genre-->
    <div class="form-group">
        <asp:Label ID="Label7" runat="server" Text="Genre"></asp:Label>
        <asp:DropDownList ID="ddlGenre" runat="server" DataSourceID="SqlDataSource4" DataTextField="genre_description" DataValueField="genre_id" CssClass="form-control"></asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:disk_inventoryKPConnectionString %>" SelectCommand="SELECT [genre_id], [genre_description] FROM [Genre]"></asp:SqlDataSource>
   </div>

    <!-- tags for button-->
        <div class="form-group">
        <asp:Button ID="btn_Submit" runat="server" CssClass="btn btn-outline-secondary" Text="Submit" OnClick="btn_Submit_Click" />
   </div>

    

        

</asp:Content>
