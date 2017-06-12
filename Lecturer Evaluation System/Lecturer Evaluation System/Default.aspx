<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true"
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
                <img class="img-responsive" src="images/bg/me.jpg" draggable="false" alt="">
              </div>
                
              <div class="col-md-6 col-sm-12 col-xs-12">
                <div class="about-me section-space-padding">
                  
                  <h2>Lecturer Evaluation System.</h2>
                  
                  <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
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
                <h5><span data-count="2025" class="statistics-count">2025</span></h5><span>Expected Total Evaluations</span>
              </div>
            </div>
          </div>
          
          <div class="col-md-3 col-sm-6">
            <div class="statistics">
              <div class="statistics-icon"><i class="fa fa-smile-o color-3"></i>
              </div>
              <div class="statistics-content">
                <h5> <span data-count="1200" class="statistics-count">1200</span></h5><span>Evaluation Received</span>
              </div>
            </div>
          </div>
          
          <div class="col-md-3 col-sm-6">
            <div class="statistics">
              <div class="statistics-icon"><i class="fa fa-hourglass-start color-5"></i>
              </div>
              <div class="statistics-content">
                <h5><span data-count="8000" class="statistics-count">8000</span></h5><span>Evaluation Remaining</span>
              </div>
            </div>
          </div>
          
          <div class="col-md-3 col-sm-6">
            <div class="statistics">
              <div class="statistics-icon"><i class="fa fa-coffee color-4"></i>
              </div>
              <div class="statistics-content">
                <h5><span data-count="4000" class="statistics-count">4000</span></h5><span>Total Lecturer</span>
              </div>
            </div>
            </div>

           </div>
         </div>
       </div>
    </section>
    <!-- statistics end -->
    <!-- Login Start -->
    <section id="login" class="call-to-action section-space-padding text-center">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <div class="section-title">
                        <h2>Login</h2>                       
                    </div>


                </div>
            </div>
            <div class="row">

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
                 <asp:Button ID="Button1" runat="server" Text="Login" 
                         CssClass="button button-style button-style-dark button-style-icon fa fa-key " 
                         onclick="Button1_Click"></asp:Button>				    
                   
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
