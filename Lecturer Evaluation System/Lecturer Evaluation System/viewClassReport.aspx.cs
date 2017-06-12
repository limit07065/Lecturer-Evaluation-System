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
                // To populate data into Chart
                string[] XPointMember = new string[2];
                int[] YPointMember = new int[2];

                cmd = new SqlCommand("viewClassLecturer", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@lecturerID", '1'); // get from session

                try
                {
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
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