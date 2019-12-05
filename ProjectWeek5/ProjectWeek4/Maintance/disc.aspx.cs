using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectWeek4
{
    public partial class disc : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_Submit_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                var parameters = SqlDataSource1.InsertParameters;
                parameters["cd_name"].DefaultValue = cdName.Text;
                parameters["release_date"].DefaultValue = releaseDate.Text;
                parameters["status_id"].DefaultValue = ddlStatus.SelectedValue;
                parameters["diskType_id"].DefaultValue = ddlType.SelectedValue;
                parameters["genre_id"].DefaultValue = ddlGenre.SelectedValue;

                try
                {
                    SqlDataSource1.Insert();
                    cdName.Text = "";
                    releaseDate.Text = "";
                   
                }
                catch (Exception ex)
                {
                    Label5.Text = DatabaseErrorMessage(ex.Message);
                }
            }
        }
        protected void grdDisk_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
            if (e.Exception != null)
            {
                Label5.Text = DatabaseErrorMessage(e.Exception.Message) + ddlStatus.SelectedValue;
                e.ExceptionHandled = true;
                e.KeepInEditMode = true;

            } else if (e.AffectedRows == 0){
                Label5.Text = "";
            }

        }

        protected void grdDisk_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
            if (e.Exception != null)
            {
                Label5.Text = DatabaseErrorMessage(e.Exception.Message);
                e.ExceptionHandled = true;
            }

        }

        private string DatabaseErrorMessage(string errorMsg)
        {
            return $"<b>A database error has occurred:</b> {errorMsg}";
        }
    }
}