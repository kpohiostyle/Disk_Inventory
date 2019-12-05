using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectWeek4
{
    public partial class borrower : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_Submit_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                var parameters = SqlDataSource1.InsertParameters;
                parameters["borrower_first_name"].DefaultValue = borrowerFName.Text;
                parameters["borrower_last_name"].DefaultValue = borrowerLName.Text;
                parameters["phone_number"].DefaultValue = borrowerPNumber.Text;

                try
                {
                    SqlDataSource1.Insert();
                    borrowerFName.Text = "";
                    borrowerLName.Text = "";
                    borrowerPNumber.Text = "";
                    Label5.Text = "";
                }
                catch (Exception ex)
                {
                    Label5.Text = DatabaseErrorMessage(ex.Message);
                }
            }
        }
        protected void grdBorrower_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
            if (e.Exception != null)
            {
                Label5.Text = DatabaseErrorMessage(e.Exception.Message);
                e.ExceptionHandled = true;
                e.KeepInEditMode = true;
                
            }
            
        }

        protected void grdBorrower_RowDeleted(object sender, GridViewDeletedEventArgs e)
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