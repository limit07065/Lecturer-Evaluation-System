<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true"
    CodeBehind="evaluate.aspx.cs" Inherits="Lecturer_Evaluation_System.evaluate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Evaluation Form</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="student" class="call-to-action section-space-padding text-center home-section"
        style="background: #fafffb;height:130%">
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <div class="section-title">
                  <h2>Evaluation Form</h2>                       
                </div>
            </div>
            
            <div class="col-sm-2 col-sm-offset-1 text-left ">
                <asp:Label ID="Label1" runat="server" Text="Label">Lecturer Name:</asp:Label>
               
            </div>
            <div class="col-sm-8 text-left">
                <asp:Label ID="LabelLecturer" runat="server" ></asp:Label>            
            </div>

            <div class="col-sm-2 col-sm-offset-1 text-left">
                <asp:Label ID="Label2" runat="server" >Class:</asp:Label>
            </div>
            <div class="col-sm-4 text-left">
                <asp:Label ID="LabelClass" runat="server" ></asp:Label>
            </div>

            <div class="col-sm-2 text-right">
                <asp:Label ID="Label4" runat="server" Text="">Semester:</asp:Label>
            </div>
            <div class="col-sm-2 text-left">
                <asp:Label ID="LabelSemester" runat="server" ></asp:Label>
            </div>

            <div class="col-sm-10 col-sm-offset-1">
                <div class="row  text-left" >
                    <div class="col-xs-12 form-control">
                        <div class="col-xs-7"><h4>Criteria</h4></div>
                        <div class="col-xs-1"><h4>1</h4></div>
                        <div class="col-xs-1"><h4>2</h4></div>
                        <div class="col-xs-1"><h4>3</h4></div>
                        <div class="col-xs-1"><h4>4</h4></div>
                        <div class="col-xs-1"><h4>5</h4></div>
                    </div>
                    <div class="col-xs-12 form-control">
                        <div class="col-xs-7"><b>1. Knowledge Conduction</b></div>
                        <div class="col-xs-1"><asp:RadioButton ID="RadioButton1" runat="server" GroupName="q1" value="1"></asp:RadioButton></div>
                        <div class="col-xs-1"><asp:RadioButton ID="RadioButton6" runat="server" GroupName="q1" value="2"></asp:RadioButton></div>
                        <div class="col-xs-1"><asp:RadioButton ID="RadioButton7" runat="server" GroupName="q1" value="3"></asp:RadioButton></div>
                        <div class="col-xs-1"><asp:RadioButton ID="RadioButton8" runat="server" GroupName="q1" value="4"></asp:RadioButton></div>
                        <div class="col-xs-1"><asp:RadioButton ID="RadioButton9" runat="server" GroupName="q1" value="5"></asp:RadioButton></div>
                    </div>
                     <div class="col-xs-12 form-control">
                        <div class="col-xs-7"><b>2. Project Guidance</b></div>
                        <div class="col-xs-1"><asp:RadioButton ID="RadioButton2" runat="server" GroupName="q2" value="1"></asp:RadioButton></div>
                        <div class="col-xs-1"><asp:RadioButton ID="RadioButton3" runat="server" GroupName="q2" value="2"></asp:RadioButton></div>
                        <div class="col-xs-1"><asp:RadioButton ID="RadioButton4" runat="server" GroupName="q2" value="3"></asp:RadioButton></div>
                        <div class="col-xs-1"><asp:RadioButton ID="RadioButton5" runat="server" GroupName="q2" value="4"></asp:RadioButton></div>
                        <div class="col-xs-1"><asp:RadioButton ID="RadioButton10" runat="server" GroupName="q2" value="5"></asp:RadioButton></div>
                    </div>
                    <div class="col-xs-12 form-control">
                        <div class="col-xs-7"><b>3. Communication</b></div>
                        <div class="col-xs-1"><asp:RadioButton ID="RadioButton11" runat="server" GroupName="q3" value="1"></asp:RadioButton></div>
                        <div class="col-xs-1"><asp:RadioButton ID="RadioButton14" runat="server" GroupName="q3" value="2"></asp:RadioButton></div>
                        <div class="col-xs-1"><asp:RadioButton ID="RadioButton15" runat="server" GroupName="q3" value="3"></asp:RadioButton></div>
                        <div class="col-xs-1"><asp:RadioButton ID="RadioButton16" runat="server" GroupName="q3" value="4"></asp:RadioButton></div>
                        <div class="col-xs-1"><asp:RadioButton ID="RadioButton17" runat="server" GroupName="q3" value="5"></asp:RadioButton></div>
                    </div>
                    <div class="col-xs-12 form-control">
                        <div class="col-xs-7"><b>4. Encouragement and Motivation</b></div>
                        <div class="col-xs-1"><asp:RadioButton ID="RadioButton12" runat="server" GroupName="q4" value="1"></asp:RadioButton></div>
                        <div class="col-xs-1"><asp:RadioButton ID="RadioButton18" runat="server" GroupName="q4" value="2"></asp:RadioButton></div>
                        <div class="col-xs-1"><asp:RadioButton ID="RadioButton19" runat="server" GroupName="q4" value="3"></asp:RadioButton></div>
                        <div class="col-xs-1"><asp:RadioButton ID="RadioButton20" runat="server" GroupName="q4" value="4"></asp:RadioButton></div>
                        <div class="col-xs-1"><asp:RadioButton ID="RadioButton21" runat="server" GroupName="q4" value="5"></asp:RadioButton></div>
                    </div>
                        <div class="col-xs-12 form-control">                   
                        <div class="col-xs-7"><b>5. Attitude </b></div>
                        <div class="col-xs-1"><asp:RadioButton ID="RadioButton13" runat="server" GroupName="q5" value="1"></asp:RadioButton></div>
                        <div class="col-xs-1"><asp:RadioButton ID="RadioButton22" runat="server" GroupName="q5" value="2"></asp:RadioButton></div>
                        <div class="col-xs-1"><asp:RadioButton ID="RadioButton23" runat="server" GroupName="q5" value="3"></asp:RadioButton></div>
                        <div class="col-xs-1"><asp:RadioButton ID="RadioButton24" runat="server" GroupName="q5" value="4"></asp:RadioButton></div>
                        <div class="col-xs-1"><asp:RadioButton ID="RadioButton25" runat="server" GroupName="q5" value="5"></asp:RadioButton></div>
                        </div>

                        <div class="col-xs-12 form-control" style="height:120px">  
                          
                                <div class="col-xs-12" ><b>6. Other Comment</b> <br /> <br /></div>
                               
                                <div class="col-xs-12"  ><b>       
                                    <asp:TextBox ID="TextArea1" TextMode="multiline"  runat="server" Height="70" CssClass="col-xs-12" />
                                    </b></div>
                           
                     
                        </div>
                         <div class="col-xs-12 form-control text-center" style="height:120px"> 
                        <asp:Button ID="Button1" runat="server" Text="Submit" onclick="Button1_Click" CssClass="button button-style button-style-dark center-block" ></asp:Button>
                        </div>


                        
                </div>
            </div>
             
        </div>
    </div>
</section>

</asp:Content>
