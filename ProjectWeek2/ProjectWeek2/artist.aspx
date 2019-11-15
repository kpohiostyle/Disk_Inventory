<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="artist.aspx.cs" Inherits="ProjectWeek2.artist" %>
<asp:Content ID="Content1" runat="server" contentplaceholderid="MainContent">
    <!--Created Kevin Powell-->
    <!--Edited 11/15/2019-->
   <h1 class="h1Borrower">Current Artists</h1>
    <!--creates grid view from database with edit and delete capabilites -->
    <asp:GridView ID="grdArtist" runat="server" AutoGenerateColumns="False" DataKeyNames="artist_id" 
        CssClass="table table-bordered table-striped table-condensed"
        DataSourceID="SqlDataSource1"
        OnRowDeleted="grdArtist_RowDeleted" 
        OnRowUpdated="grdArtist_RowUpdated">
        <Columns>
            <asp:TemplateField HeaderText="ArtistID" InsertVisible="False" SortExpression="artist_id">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("artist_id") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("artist_id") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="First Name" SortExpression="artist_first_name">
                <EditItemTemplate>
                    <asp:TextBox ID="atfirstName" runat="server" Text='<%# Bind("artist_first_name") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" Display="Dynamic" ControlToValidate="atFirstName" ValidationGroup="Edit"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("artist_first_name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Last Name" SortExpression="artist_last_name">
                <EditItemTemplate>
                    <asp:TextBox ID="atLastName" runat="server" Text='<%# Bind("artist_last_name") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("artist_last_name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField CausesValidation="True" ShowEditButton="True" ValidationGroup="Edit" />
            <asp:CommandField CausesValidation="False" ShowDeleteButton="True" ValidationGroup="Edit" />
        </Columns>
    </asp:GridView>
    <!-- creates datasource for database, generates code for commands delete, insert, select, update-->
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:disk_inventoryKPConnectionString %>" 
        DeleteCommand="sp_DeleteArtist" 
        InsertCommand="sp_InsertArtist" 
        SelectCommand="SELECT [artist_id], [artist_first_name], [artist_last_name] FROM [Artist] ORDER BY [artist_last_name], [artist_first_name]" 
        UpdateCommand="sp_UpdateArtist" DeleteCommandType="StoredProcedure" InsertCommandType="StoredProcedure" UpdateCommandType="StoredProcedure">
        <DeleteParameters>
            <asp:Parameter Name="artist_id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="artist_first_name" Type="String" />
            <asp:Parameter Name="artist_last_name" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="artist_id" Type="Int32" />
            <asp:Parameter Name="artist_first_name" Type="String" />
            <asp:Parameter Name="artist_last_name" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <!--Label for Error Message-->
    <asp:Label ID="Label5" runat="server" EnableViewState="False"></asp:Label>
    <asp:Label ID="Label4" runat="server"><h4>Enter information below to add new artist</h4></asp:Label>
    
    <!--tags for first name-->
    <div class="form-group">      
        <asp:Label ID="Label1" runat="server" Text="First Name"></asp:Label>
        <asp:TextBox ID="artistFName" runat="server" CssClass="form-control"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="artistFName" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
    </div>
    <!--tags for last name-->
    <div class="form-group">
        <asp:Label ID="Label2" runat="server" Text="Last Name"></asp:Label>
        <asp:TextBox ID="artistLName" runat="server" CssClass="form-control"></asp:TextBox>
   </div>
   <!--tags for button-->
        <div class="form-group">
        <asp:Button ID="btn_Submit" runat="server" CssClass="btn btn-outline-secondary" Text="Submit" OnClick="btn_Submit_Click" />
   </div>
    

   
</asp:Content>

