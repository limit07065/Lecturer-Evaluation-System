﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="Lecturer_Evaluation_System.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Preloader Start -->
    <!--
    <div id="preloader">
        <div class="loader">
        </div>
    </div>
    -->
    <!-- Preloader End -->
    <!-- Home & Menu Section Start -->
   
    <!-- Home & Menu Section End-->
    <!-- About Start -->
    <section id="about" class="about-section">
         <div class="row">
               
              <div class="col-md-6 col-sm-12 col-xs-12">
                <img class="img-responsive" src="images/bg/me.jpg" draggable="false" alt=""/>
              </div>
                
              <div class="col-md-6 col-sm-12 col-xs-12">
                <div class="about-me section-space-padding">
                  
                  <h2>Lecturer Evaluation System.</h2>
                  
                  <p>Lecturer Evaluation System is a platform that allows student feedback on lecturer performance. While it is appreciated to have honest opinion, student should refrain from being rude during the evaluation.</p>
                 </div>
             
              </div>
                
          </div>
       </section>
    <!-- About End -->
     <!-- statistics -->
    <section class="statistics-section section-space-padding bg-cover text-center" data-stellar-background-ratio="0.3">
         <div class="container">     

            <div class="row">
             <div class="statistics-center">  <!-- This code will work at max-width: 767px -->

           <div class="col-md-3 col-sm-6">
            <div class="statistics">
              <div class="statistics-icon"><i class="fa fa-check-square-o color-1"></i>
              </div>
              <div class="statistics-content">
                <h5><span data-count="<%= totalEnrolled %>" class="statistics-count"><%= totalEnrolled %></span></h5><span>Expected Total Evaluations</span>
              </div>
            </div>
          </div>
          
          <div class="col-md-3 col-sm-6">
            <div class="statistics">
              <div class="statistics-icon"><i class="fa fa-smile-o color-3"></i>
              </div>
              <div class="statistics-content">
                <h5> <span data-count="<%= totalRated %>" class="statistics-count"><%= totalRated %></span></h5><span>Evaluation Received</span>
              </div>
            </div>
          </div>
          
          <div class="col-md-3 col-sm-6">
            <div class="statistics">
              <div class="statistics-icon"><i class="fa fa-hourglass-start color-5"></i>
              </div>
              <div class="statistics-content">
                <h5><span data-count="<%= totalNotRated %>" class="statistics-count"><%= totalNotRated %></span></h5><span>Evaluation Remaining</span>
              </div>
            </div>
          </div>
          
          <div class="col-md-3 col-sm-6">
            <div class="statistics">
              <div class="statistics-icon"><i class="fa fa-coffee color-4"></i>
              </div>
              <div class="statistics-content">
                <h5><span data-count="<%= totalLecturer %>" class="statistics-count"><%= totalLecturer %></span></h5><span>Total Lecturer</span>
              </div>
            </div>
            </div>

           </div>
         </div>
       </div>
    </section>
    <!-- statistics end -->
    <!-- Login Start -->
    <section id="login" class="call-to-action section-space-padding text-center home-section" style="background:#fafffb" >
        <div class="display-table">
            <div class="display-table-cell">
                <div class="col-sm-12">
                    <div class="section-title">
                        <h2>Login</h2>                       
                    </div>


                </div>
            

                <div class="col-sm-4 col-sm-offset-2">
					<div class="form-group">
                        <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" placeholder="Login ID" ></asp:TextBox>
				    	
				    </div>
                </div>
							
                <div class="col-sm-4">
				    <div class="form-group">
					    <asp:TextBox ID="TextBox2" TextMode="Password" runat="server" CssClass="form-control" placeholder="Password"></asp:TextBox>
				    </div>
                </div>

                 <div class="col-sm-12">
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Login ID is required" ControlToValidate="TextBox1" ForeColor="Red"></asp:RequiredFieldValidator>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Password is required" ControlToValidate="TextBox2" ForeColor="Red"></asp:RequiredFieldValidator><br />
                 <asp:Label ID="Label1" runat="server" CssClass="center-block" ForeColor="Red"></asp:Label>
                 <asp:Button ID="Button1" runat="server" Text="Login" 
                         CssClass="button button-style button-style-dark button-style-icon fa fa-key " 
                         onclick="Button1_Click"></asp:Button>				    
                   
                </div>

            </div> 
            </div>  
     
     </section>
    <!-- Login End -->    
   
   
    <!-- Footer Start 
    <footer class="footer-section">
        <div class="container">
            <div class="row">
               
      <div class="col-md-4 text-left">
       <p><span><a href="#about" class="smoth-scroll">About Me</a></span> | <span><a href="#portfolio" class="smoth-scroll">Portfolio</a></span></p>
          </div>
               
            <div class="col-md-4 text-center">
               <p>© Copyright 2016 Rolling.</p>
               </div>
              
             <div class="col-md-4 uipasta-credit text-right">
                <p>Design By <a href="http://www.uipasta.com" target="_blank" title="UiPasta">UiPasta</a></p>
                </div>
                
             </div>
        </div>
    </footer>
    <!-- Footer End -->
    <!-- Back to Top Start -->
    <a href="#" class="scroll-to-top"><i class="fa fa-angle-up"></i></a>
    <!-- Back to Top End -->
    <!-- All Javascript Plugins  -->
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/plugin.js"></script>
    <script type="text/javascript" src="http://maps.google.com/maps/api/js?key=AIzaSyC0HAKwKinpoFKNGUwRBgkrKhF-sIqFUNA"></script>
    <!-- Main Javascript File  -->
    <script type="text/javascript" src="js/scripts.js"></script>
</asp:Content>
