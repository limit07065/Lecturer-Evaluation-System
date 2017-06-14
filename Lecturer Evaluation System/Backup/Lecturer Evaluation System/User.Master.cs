using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Lecturer_Evaluation_System
{
    public partial class User : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LinkButton1_OnClick(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("/Default.aspx");
        }
    }
}