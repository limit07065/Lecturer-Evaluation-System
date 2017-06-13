using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace Lecturer_Evaluation_System
{
    public partial class evaluate : System.Web.UI.Page{
    
        protected static string ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        protected SqlConnection con;
        protected SqlCommand cmd;
        /*
        protected void Page_Load(object sender, EventArgs e)
        {
            
            //forward user other than student
            if (!(Session["userType"].ToString().Equals("0")))
            {
                Response.Redirect("~/default.aspx");
            }
            
            //forward user who type in directly
            try
            {
                String url = Request.UrlReferrer.OriginalString;
            }
            catch (NullReferenceException enull)
            {
                Response.Redirect("~/Error403.aspx");
            }
            
            String classID = (string)Session["classID"];
            using (con = new SqlConnection(ConnectionString))
            {               
                // get class detail
                cmd = new SqlCommand("viewClass", con);
                cmd.CommandType = CommandType.StoredProcedure;                
                cmd.Parameters.AddWithValue("@classID", classID);

                try
                {
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        //display class info to aspx
                        LabelLecturer.Text = (string) reader["lecturerName"];
                        LabelSemester.Text = (string)reader["semester"];
                        LabelClass.Text = (string)reader["className"];                        
                       
                    }                   
                }
                catch (Exception ex)
                {
                    Console.Write(ex.Message);
                }
                finally { con.Close(); }

                // get previous evaluation
                cmd = new SqlCommand("viewEvaluation", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@studentID", Session["userID"]);
                cmd.Parameters.AddWithValue("@classID", classID);                

                try
                {
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        //display output to aspx
                        if (reader["classID"].ToString().Equals(Request.QueryString["classID"].ToString()))
                        {
                          
                        }
                    }

                  
                }
                catch (Exception ex)
                {
                    Console.Write(ex.Message);
                }
                finally { con.Close(); }
            }
        }*/
    }
}