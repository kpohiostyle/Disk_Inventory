<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ProjectWeek4._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <!--Created Kevin Powell-->
    <!--Edited 11/15/2019-->
    <div class="jumbotron">
        <h1>Disk Inventory</h1>
        <p class="lead">Welcome To Headbangers Disk Inventory</p>
        <p class="lead">To begin click on a link below</p>
    </div>

    <div class="row">
        <div class="col-md-4">
            <h2>Add or Update a borrower</h2>
            <p>
               <a href="Maintance/borrower.aspx" class="btn btn-primary btn-lg">Borrower Page &raquo;</a>
            </p>
            <p>
             
            </p>
        </div>
        <div class="col-md-4">
            <h2>Add or update a disk </h2>
            <p>
                <a href="Maintance/disc.aspx" class="btn btn-primary btn-lg">Disk Page &raquo;</a>
            </p>
            <p>
                
            </p>
        </div>
        <div class="col-md-4">
            <h2>Add or update and artist</h2>
            <p>
                <a href="Maintance/artist.aspx" class="btn btn-primary btn-lg">Artist Page &raquo;</a>
            </p>
            <p>
                
            </p>
        </div>
    </div>

</asp:Content>
