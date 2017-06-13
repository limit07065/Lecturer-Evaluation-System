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

        protected void Page_Load(object sender, EventArgs e)
        {
            //forward user other than student
            if (Session["userID"] != "0")
            {
                Response.Redirect("~/Error403.aspx");
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

            String classID = (string)Request.QueryString["classID"];
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
                            YPointMember[0] = int.Parse(reader["totalRated"].ToString());
                            XPointMember[0] = YPointMember[0].ToString() + " - Rated";

                            YPointMember[1] = int.Parse(reader["totalEnrolled"].ToString()) - int.Parse(reader["totalRated"].ToString());
                            XPointMember[1] = YPointMember[1].ToString() + " - Not Rated";
                        }
                    }

                    Chart1.Series[0].Points.DataBindXY(XPointMember, YPointMember);

                    //Setting width of line  
                    Chart1.Series[0].BorderWidth = 10;
                    //setting Chart type   
                    Chart1.Series[0].ChartType = SeriesChartType.Pie;
                }
                catch (Exception ex)
                {
                    Console.Write(ex.Message);
                }
                finally { con.Close(); }



                // End populate data into Chart

                // To populate data into gridview
                cmd = new SqlCommand("viewComments", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@classID", Request.QueryString["classID"]);

                DataSet ds = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmd;
                da.Fill(ds);

                GridView1.DataSource = ds;
                GridView1.DataBind();
                // End populating data into gridview
            }
        }
    }
}