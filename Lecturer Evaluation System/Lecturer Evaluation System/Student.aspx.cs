﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Lecturer_Evaluation_System
{
    public partial class Student : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void evaluate(object sender, EventArgs e)
        {
            Response.Redirect("~/viewClassReport.aspx?");
            Session["userID"] = reader["userID"].ToString();
            Session["userType"] = reader["userType"].ToString();
            Session["fullname"] = reader["fullname"].ToString();
        }
    }

    
}