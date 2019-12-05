using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace ProjectWeek4
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            
        }
        protected void btn_Submit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                SqlConnection conn;
                SqlCommand comm;

                string connectionString = ConfigurationManager.ConnectionStrings["disk_inventoryKPConnectionString"].ConnectionString;
                conn = new SqlConnection(connectionString);
                comm = new SqlCommand(
            "Execute sp_ins_checkout @borrower_id, @cd_id, @borrowed_date", conn);

                //Add parameter
                comm.Parameters.Add("@borrower_id", System.Data.SqlDbType.Int);
                comm.Parameters["@borrower_id"].Value = ddlBorrower.SelectedValue;
                comm.Parameters.Add("@cd_id", System.Data.SqlDbType.Int);
                comm.Parameters["@cd_id"].Value = ddlDisk.SelectedValue;
                comm.Parameters.Add("@borrowed_date", System.Data.SqlDbType.Date);
                comm.Parameters["@borrowed_date"].Value = txtDate.Text;
                try
                {
                    conn.Open();
                    comm.ExecuteNonQuery();

                    ddlDisk.DataBind();
                    Label1.Text = "New checkout added for borrower:" + ddlBorrower.SelectedItem + " & Disk:" + ddlDisk.SelectedItem;
                }
                catch (SqlException ex)
                {
                    // Display error message
                    string str;
                    str = "Source:" + ex.Source;
                    str += "\n" + "Number:" + ex.Number.ToString();
                    str += "\n" + "Message:" + ex.Message;
                    str += "\n" + "Class:" + ex.Class.ToString();
                    str += "\n" + "Procedure:" + ex.Procedure.ToString();
                    str += "\n" + "Line Number:" + ex.LineNumber.ToString();
                    str += "\n" + "Server:" + ex.Server.ToString();
                    // Display error message
                    Label1.Text = str;
                }
                finally
                {
                    // Close the connection
                    conn.Close();
                }
            }
        }
    }
}