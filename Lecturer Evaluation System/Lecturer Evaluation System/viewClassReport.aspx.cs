using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Web.UI.DataVisualization.Charting;
using System.Drawing;

namespace Lecturer_Evaluation_System
{
    public partial class viewClassReport : System.Web.UI.Page
    {
        protected static string ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        protected SqlConnection con;
        protected SqlCommand cmd;

        protected void Page_Load(object sender, EventArgs e)
        {
            using (con = new SqlConnection(ConnectionString))
            {
                // To populate data into Chart1 //
                string[] XPointMember = new string[2];
                int[] YPointMember = new int[2];

                cmd = new SqlCommand("viewClassReportById", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@classID", Request.QueryString["classID"].ToString());

                try
                {
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        YPointMember[0] = int.Parse(reader["totalRated"].ToString());
                        XPointMember[0] = YPointMember[0].ToString() + " - Rated";

                        YPointMember[1] = int.Parse(reader["totalEnrolled"].ToString()) - int.Parse(reader["totalRated"].ToString());
                        XPointMember[1] = YPointMember[1].ToString() + " - Not Rated";

                        lblClassName.Text = reader["className"].ToString();
                        lblTotalStudent.Text = reader["totalEnrolled"].ToString();
                        lblTotalRated.Text = reader["totalRated"].ToString();
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
                // End populate data into Chart1 //

                // To populate data into Chart2 //
                XPointMember = new string[5];
                YPointMember = new int[5];

                cmd = new SqlCommand("viewAverageMarkForEachQuestion", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@classID", Request.QueryString["classID"].ToString());

                try
                {
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        XPointMember[0] = "Question 1";
                        YPointMember[0] = int.Parse(reader["Question1"].ToString());

                        XPointMember[1] = "Question 2";
                        YPointMember[1] = int.Parse(reader["Question2"].ToString());

                        XPointMember[2] = "Question 3";
                        YPointMember[2] = int.Parse(reader["Question3"].ToString());

                        XPointMember[3] = "Question 4";
                        YPointMember[3] = int.Parse(reader["Question4"].ToString());

                        XPointMember[4] = "Question 5";
                        YPointMember[4] = int.Parse(reader["Question5"].ToString());
                    }
                    Chart2.Series[0].Points.DataBindXY(XPointMember, YPointMember);

                    //Setting width of line  
                    Chart2.Series[0].BorderWidth = 10;
                    //setting Chart type   
                    Chart2.Series[0].ChartType = SeriesChartType.Column;
                    //set colour for each bar
                    foreach (Series charts in Chart2.Series)
                    {
                        foreach (DataPoint point in charts.Points)
                        {
                            switch (point.AxisLabel)
                            {
                                case "Question 1": point.Color = Color.RoyalBlue; break;
                                case "Question 2": point.Color = Color.GreenYellow; break;
                                case "Question 3": point.Color = Color.Indigo; break;
                                case "Question 4": point.Color = Color.MediumVioletRed; break;
                                case "Question 5": point.Color = Color.SpringGreen; break;
                            }
                        }
                    }    
                    
                }
                catch (Exception ex)
                {
                    Console.Write(ex.Message);
                }
                finally { con.Close(); }
                // End populate data into Chart2 //

                // To populate data into gridview //
                cmd = new SqlCommand("viewComments", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@classID", Request.QueryString["classID"]);

                DataSet ds = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmd;
                da.Fill(ds);

                GridView1.DataSource = ds;
                GridView1.DataBind();
                // End populating data into gridview //
            }
        }
    }
}