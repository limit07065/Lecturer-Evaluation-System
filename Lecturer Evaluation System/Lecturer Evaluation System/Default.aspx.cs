using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace Lecturer_Evaluation_System
{
    public partial class Default : System.Web.UI.Page
    {
        protected static string ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        protected SqlConnection con;
        protected SqlCommand cmd;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userType"] != null)
            {
                int usertype = Convert.ToInt32(Session["userType"]);
                redirectBasedOnUserType(usertype);
            }

            if (Session["error"] != null)
            {
                Label1.Text = Session["error"].ToString();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                using (con = new SqlConnection(ConnectionString))
                {
                    cmd = new SqlCommand("login", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@username", TextBox1.Text);
                    cmd.Parameters.AddWithValue("@password", TextBox2.Text);

                    try
                    {
                        con.Open();
                        SqlDataReader reader = cmd.ExecuteReader();

                        if (reader.Read() != false)
                        {
                            Session["userID"] = reader["userID"].ToString();
                            Session["userType"] = reader["userType"].ToString();
                            Session["fullname"] = reader["fullname"].ToString();
                        }
                        else
                        {
                            invalidLogin();
                        }
                    }
                    catch (Exception ex)
                    {
                        Console.Write(ex.Message);
                    }
                    finally { con.Close(); }
                    redirectBasedOnUserType(Convert.ToInt32(Session["userType"]));
                    
                }
            }
        }

        //why not triggered ._.
        protected void invalidLogin()
        {
            Session["error"] = "Invalid ID or password";
            Response.Redirect("/Default.aspx#login");            
        }


        protected void redirectBasedOnUserType(int usertype)
        {
            switch (Session["userType"].ToString())
            {
                case "0":
                    Response.Redirect("/Student.aspx");
                    break;

                case "1":
                    Response.Redirect("/Lecturer.aspx");
                    break;

                case "2":
                    Response.Redirect("/Admin.aspx");
                    break;

                default:
                    Response.Redirect("/Default.aspx");
                    break;
            }
        }
    }
}