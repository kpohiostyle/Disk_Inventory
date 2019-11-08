using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectWeek2
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
                Label5.Text = "The Information Has Been <br /> Added Successfully. Add Another Borrower";
                borrowerFName.Text = "";
                borrowerLName.Text = "";
                borrowerPNumber.Text = "";
            }
            else
            {
                Label5.Text = "Please Fix Any Errors And Submit Again";
            }
        }
    }
}