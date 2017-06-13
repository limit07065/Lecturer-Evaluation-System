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
    public partial class evaluate : System.Web.UI.Page
    {
       
        List<RadioButton> rbs = new List<RadioButton>();
        protected static string ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        protected SqlConnection con;
        protected SqlCommand cmd;
        protected int rateID;
        protected int[] qValues = new int [5]{0,0,0,0,0}; 
        protected List<string> question  = new List<string>();

        protected void Page_Load(object sender, EventArgs e)
        { 
            
            if (Session["userType"] == null)
            {
                Response.Redirect("~/default.aspx");
            }

            //forward user other than student
            if (!(Session["userType"].ToString().Equals("0")))
            {
                Response.Redirect("~/default.aspx");
            }
            if (!IsPostBack)
            {
                question.Add("q1");
                question.Add("q2");
                question.Add("q3");
                question.Add("q4");
                question.Add("q5");

                rbs.Add(RadioButton1);
                rbs.Add(RadioButton2);
                rbs.Add(RadioButton3);
                rbs.Add(RadioButton4);
                rbs.Add(RadioButton5);
                rbs.Add(RadioButton6);
                rbs.Add(RadioButton7);
                rbs.Add(RadioButton8);
                rbs.Add(RadioButton9);
                rbs.Add(RadioButton10);
                rbs.Add(RadioButton11);
                rbs.Add(RadioButton12);
                rbs.Add(RadioButton13);
                rbs.Add(RadioButton14);
                rbs.Add(RadioButton15);
                rbs.Add(RadioButton16);
                rbs.Add(RadioButton17);
                rbs.Add(RadioButton18);
                rbs.Add(RadioButton19);
                rbs.Add(RadioButton20);
                rbs.Add(RadioButton21);
                rbs.Add(RadioButton22);
                rbs.Add(RadioButton23);
                rbs.Add(RadioButton24);
                rbs.Add(RadioButton25);

                getClass();
                getEvaluation();
            }
        }

        protected void getClass()
        {
            using (con = new SqlConnection(ConnectionString))
            {
                // get class detail
                cmd = new SqlCommand("viewClass", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@classID", Session["classID"].ToString());

                try
                {
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        //display class info to aspx
                        LabelLecturer.Text = (string)reader["lecturerName"];
                        LabelSemester.Text = (string)reader["semester"];
                        LabelClass.Text = (string)reader["className"];

                    }
                }
                catch (Exception ex)
                {
                    Console.Write(ex.Message);
                }
                finally { con.Close(); }
            }

        }

        protected int getEvaluation()
        {
            int exist = 0;
            using (con = new SqlConnection(ConnectionString))
            {
                // get previous evaluation
                cmd = new SqlCommand("viewEvaluation", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@studentID", Convert.ToInt32(Session["userID"]));
                cmd.Parameters.AddWithValue("@classID", Convert.ToInt32(Session["classID"]));

                try
                {
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    //display output to aspx
                    while (reader.Read())
                    {
                         qValues[0] = Convert.ToInt32(reader["question1"]);
                         qValues[1] = Convert.ToInt32(reader["question2"]);
                         qValues[2] = Convert.ToInt32(reader["question3"]);
                         qValues[3] = Convert.ToInt32(reader["question4"]);
                         qValues[4] = Convert.ToInt32(reader["question5"]);
                        rateID = Convert.ToInt32(reader["rateID"]);
                        String comment = "";                        

                        

                        if (reader["comment"] != null)
                        {
                            comment = reader["comment"].ToString();
                        }
                       
                        //show previous evaluation
                        showChoice(question);
                        TextArea1.Text = comment;
                        exist = 1;


                    }



                }
                catch (Exception ex)
                {
                    Console.Write(ex.Message);
                }
                finally { con.Close(); }
            }
            return exist;
        }     

        protected void showChoice(List<string> question)
        {
         
           
            
            

            for (int i = 0; i < question.Count; i++)
            {
                foreach (RadioButton radioButton in rbs)
                {
                    
                    if (radioButton.GroupName.Equals(question.ElementAt(i)) && Convert.ToInt32(radioButton.Attributes["value"]) == qValues[i])
                    {
                        radioButton.Checked = true;
                        
                    }
                }

            }


        }

        private string getRadioValue(ControlCollection clts, string groupName)
        {
            string ret = "";
            foreach (Control ctl in clts)
            {
                if (ctl.Controls.Count != 0)
                {
                    if (ret == "")
                        ret = getRadioValue(ctl.Controls, groupName);
                }

                if (ctl.ToString() == "System.Web.UI.WebControls.RadioButton")
                {
                    RadioButton rb = (RadioButton)ctl;
                    if (rb.GroupName == groupName && rb.Checked == true)
                        ret = rb.Attributes["Value"];
                }
            }
            return ret;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int exist = getEvaluation();
            if (exist == 1)
                updateEvaluation();
            else
                addEvaluation();

        }

        protected void updateEvaluation() 
        {

            using (con = new SqlConnection(ConnectionString))
            {
                // update evaluation
                updateQ();
                float avg = 0;
                for(int i=0;i<5;i++)
                {
                    avg += qValues[i];
                }
                avg/=5;
                cmd = new SqlCommand("updateEvaluation", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@question1", qValues[0]);
                cmd.Parameters.AddWithValue("@question2", qValues[1]);
                cmd.Parameters.AddWithValue("@question3", qValues[2]);
                cmd.Parameters.AddWithValue("@question4", qValues[3]);
                cmd.Parameters.AddWithValue("@question5", qValues[4]);
                cmd.Parameters.AddWithValue("@comment", TextArea1.Text);
                cmd.Parameters.AddWithValue("@average",avg );
                cmd.Parameters.AddWithValue("@rateID", rateID);
               

                try
                {
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    //display output to aspx
                    while (reader.Read())
                    {
                        Response.Redirect("~/Default.aspx"); 
                    }



                }
                catch (Exception ex)
                {
                    Console.Write(ex.Message);
                }
                finally { con.Close(); }
            }
        }

        protected void addEvaluation()
        {

            using (con = new SqlConnection(ConnectionString))
            {
                // add evaluation
                updateQ();
                float avg = 0;
                for(int i=0;i<5;i++)
                {
                    avg += qValues[i];
                }
                avg/=5;
                cmd = new SqlCommand("addEvaluation", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@question1", qValues[0]);
                cmd.Parameters.AddWithValue("@question2", qValues[1]);
                cmd.Parameters.AddWithValue("@question3", qValues[2]);
                cmd.Parameters.AddWithValue("@question4", qValues[3]);
                cmd.Parameters.AddWithValue("@question5", qValues[4]);
                cmd.Parameters.AddWithValue("@comment", TextArea1.Text);
                cmd.Parameters.AddWithValue("@average",avg );
                cmd.Parameters.AddWithValue("@studentID", Convert.ToInt32(Session["userID"]));
                cmd.Parameters.AddWithValue("@classID", Convert.ToInt32(Session["classID"]));
               

                try
                {
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    //display output to aspx
                    while (reader.Read())
                    {
                       Response.Redirect("~/Default.aspx"); 
                    }



                }
                catch (Exception ex)
                {
                    Console.Write(ex.Message);
                }
                finally { con.Close(); }
            }
        }

        protected void updateQ()
        {
            for (int i = 0; i < 5; i++)
            {
                foreach (RadioButton radioButton in rbs)
                {

                    if (radioButton.GroupName.Equals(question.ElementAt(i)) && radioButton.Checked==true)
                    {
                        qValues[i] = Convert.ToInt32(radioButton.Attributes["value"]);
                    }
                }

            }

        }
    }
}