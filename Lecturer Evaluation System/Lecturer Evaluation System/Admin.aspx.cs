using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.IO;

namespace Lecturer_Evaluation_System
{
    public partial class Admin : System.Web.UI.Page
    {
        protected static string ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        protected SqlConnection con;
        protected SqlCommand cmd;

        protected void Page_Load(object sender, EventArgs e)
        {
            renderActivationButton();
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            using (con = new SqlConnection(ConnectionString))
            {
                cmd = new SqlCommand("viewClassBySemester", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@semesterID", DropDownList1.SelectedValue.ToString());

                DataSet ds = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmd;
                da.Fill(ds);

                GridView1.DataSource = ds;
                GridView1.DataBind();
            }
        }

        // To ensure when the page first loaded, there is data in GridView1
        protected void DropDownList1_DataBound(object sender, EventArgs e)
        {
            DropDownList1_SelectedIndexChanged(sender, e);
            renderActivationButton();
        }

        protected void btnActivate_Click(object sender, EventArgs e)
        {
            using (con = new SqlConnection(ConnectionString))
            {
                try
                {
                    con.Open();

                    cmd = new SqlCommand("deactivateAllSemester", con);
                    cmd.ExecuteNonQuery();

                    cmd = new SqlCommand("activateSemesterById", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@semesterID", DropDownList1.SelectedValue.ToString());
                    cmd.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    Console.Write(ex.Message);
                }
                finally 
                { 
                    con.Close();
                    renderActivationButton();
                    UpdatePanel1.Update();
                }
            }
        }

        protected void renderActivationButton()
        {
            StringWriter stringWriter = new StringWriter();

            using (HtmlTextWriter writer = new HtmlTextWriter(stringWriter))
            {
                using (con = new SqlConnection(ConnectionString))
                {
                    try
                    {
                        con.Open();

                        cmd = new SqlCommand("getActiveSemester", con);
                        SqlDataReader reader = cmd.ExecuteReader();

                        while (reader.Read())
                        {
                            if (reader["semesterID"].ToString().Equals(DropDownList1.SelectedValue.ToString()))
                            {
                                activationDiv.Controls.Clear();
                                writer.RenderBeginTag(HtmlTextWriterTag.Span);
                                writer.Write("This semester is activated");
                                writer.RenderEndTag();

                                activationDiv.InnerHtml = writer.InnerWriter.ToString();
                            }
                            else
                            {
                                activationDiv.InnerHtml = "";
                                Button btnActivate = new Button();
                                btnActivate.Attributes.Add("ID", "btnActivate");
                                btnActivate.Attributes.Add("class", "btn-default btn-success");
                                btnActivate.Click += new EventHandler(this.btnActivate_Click);
                                btnActivate.Text = "Activate this semester";

                                activationDiv.Controls.Add(btnActivate);
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        Console.Write(ex.Message);
                    }
                    finally { con.Close(); }
                }
            }
        }
    }
}