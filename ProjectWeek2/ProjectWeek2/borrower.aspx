<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="borrower.aspx.cs" Inherits="ProjectWeek2.borrower" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <br />
    <asp:Label ID="Label4" runat="server"><h1>Please Enter Borrower Information</h1></asp:Label>
    <br />
    <br />

   

    <asp:Label ID="Label1" runat="server" Text="First Name" Font-Bold="True" Font-Size="Larger"></asp:Label>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="borrowerFName" runat="server" CssClass="custom"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="borrowerFName" ErrorMessage="*"></asp:RequiredFieldValidator>
    <br />
    <br />
    <asp:Label ID="Label2" runat="server" Text="Last Name" Font-Bold="True" Font-Size="Larger"></asp:Label>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="borrowerLName" runat="server" CssClass="custom"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="borrowerLName" ErrorMessage="*"></asp:RequiredFieldValidator>
    <br />
    <br />
    <asp:Label ID="Label3" runat="server" Text="Phone Number" Font-Bold="True" Font-Size="Larger"></asp:Label>
    &nbsp;&nbsp;<asp:TextBox ID="borrowerPNumber" runat="server" CssClass="custom"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="borrowerPNumber"></asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
        ControlToValidate="borrowerPNumber" ErrorMessage="Please Use Format 999-999-9999" 
        ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}"></asp:RegularExpressionValidator>

    <br />
    <br />
    <br />
    <asp:Button ID="btn_Submit" runat="server" BackColor="Black" BorderColor="#CC0000" BorderStyle="Solid" BorderWidth="3px" Font-Size="X-Large" ForeColor="Gray" Text="Submit" OnClick="btn_Submit_Click" />

<br />
<br />
<br />
<asp:Label ID="Label5" runat="server"></asp:Label>

</asp:Content>
