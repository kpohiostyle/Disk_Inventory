<%@ Page Language="C#" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <script runat="server">
        protected void submitButton_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                dbErrorMessage.Text = name.Text;
                //Code that uses the data entered by the user
                //Define data objects
                SqlConnection conn;
                SqlCommand comm;
                // Read the connection string from Web.config
                string connectionString =
                    ConfigurationManager.ConnectionStrings[
                    "visitorsdb_KP"].ConnectionString;
                // Initialize connection
                conn = new SqlConnection(connectionString);
                // Create command 
                comm = new SqlCommand("EXEC InsertVisitor @name,@email, @dob, @comments", conn);
                comm.Parameters.Add("@name", System.Data.SqlDbType.VarChar, 100);
                comm.Parameters["@name"].Value = name.Text;
                comm.Parameters.Add("@email", System.Data.SqlDbType.VarChar, 100);
                comm.Parameters["@email"].Value = email.Text;
                comm.Parameters.Add("@dob", System.Data.SqlDbType.Date);
                comm.Parameters["@dob"].Value = dob.Text;
                comm.Parameters.Add("@comments", System.Data.SqlDbType.VarChar, 255);
                comm.Parameters["@comments"].Value = comments.Text;

                // Enclose database code in Try-Catch-Finally
                try
                {
                    // Open the connection
                    conn.Open();
                    // Execute the command
                    comm.ExecuteNonQuery();
                    // Reload page if the query executed successfully
                    Response.Redirect("validation.html");
                }
                catch (SqlException ex)
                {
                    // Display error message
                    dbErrorMessage.Text =
                       "Could Not Add Information to Database At This Time" + ex.Message.ToString();

                }
                finally
                {
                    // Close the connection
                    conn.Close();
                }
            }
        }

</script>

<head runat="server">
    <title>Untouchables</title>
    <meta charset="utf-8">
    <link href='https://fonts.googleapis.com/css?family=Bungee Shade' rel='stylesheet'>
    <link href='https://fonts.googleapis.com/css?family=Fruktur' rel='stylesheet'>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="jquery_validate/jquery.validate.min.js"></script>
    <link rel="stylesheet" href="../styles.css">
   

</head>
<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>

        </div>
        <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav">
                <li class="active"><a href="index.html">Home</a></li>
                <li><a href="order.html">Order</a></li>
                <li><a href="newsletter.html">Newsletter</a></li>
                

            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="signup.aspx"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>

            </ul>
        </div>
    </div>
</nav>
<body>
    <div class="company">
        <img src="../images/mobster.png" alt="Mobster">
        <h1>Untouchables</h1>
        <p>'Pizza so good, it'll get ya' whacked'</p>
    </div>

    <div class="wrapper">

        <div class="content">
            <div class="main">
                <h1>Sign Up to get our weekly specials</h1>
                <form id="signup" runat="server">
                    <div>
                        <label for="name" class="label">Name*</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="name" runat="server"></asp:TextBox>

                    </div>
                    <div>
                        <label for="email" class="label">E-mail Address*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </label>
                        &nbsp;<asp:TextBox ID="email" runat="server" CssClass="auto-style1"></asp:TextBox>
                        </div>
                    <div>
                        <label for="confirm_password" class="label">Confirm Password*&nbsp; </label>&nbsp;
                        <asp:TextBox ID="confirm_password" runat="server"></asp:TextBox>
                        </div>
                    <div>
                        <label for="dob" class="label">Date of birth&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </label>
&nbsp;
                        <asp:TextBox ID="dob" runat="server"></asp:TextBox>
                        </div>
                    <div>
                        <label for="comments" class="label">Comments&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </label>                       
                    &nbsp;
                        <asp:TextBox ID="comments" runat="server"></asp:TextBox>
                       
                        <br />
                       
                    </div>

                    <div>
                        &nbsp;<asp:Button ID="submitButton" runat="server" Text="Submit" OnClick="submitButton_Click" />
                       
                        <asp:Label ID="dbErrorMessage" runat="server" Text=""></asp:Label>
                       
                    </div>
                </form>
            </div>
        </div>

    </div>
</body>
</html>