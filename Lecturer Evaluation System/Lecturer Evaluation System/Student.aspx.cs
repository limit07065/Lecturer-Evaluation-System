using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;


namespace Lecturer_Evaluation_System
{
    public partial class Student : System.Web.UI.Page
    {
        protected static string ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        protected SqlConnection con;
        protected SqlCommand cmd;

        protected void Page_Load(object sender, EventArgs e)
        {
            using (con = new SqlConnection(ConnectionString))
            {
                cmd = new SqlCommand("viewClassStudent", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@studentID", Session["userID"].ToString());

                DataSet ds = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmd;
                da.Fill(ds);

                GridView1.DataSource = ds;
                GridView1.DataBind();
            }
        }

        protected void evaluate(object sender, EventArgs e)
        {
            Session["classID"] = GridView1.SelectedValue.ToString();
            Response.Redirect("~/evaluate.aspx");
            /*Session["userID"] = reader["userID"].ToString();
            Session["userType"] = reader["userType"].ToString();
            Session["fullname"] = reader["fullname"].ToString();
             */
        }
  
    }

    
}