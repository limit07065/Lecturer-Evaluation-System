<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true"
    CodeBehind="evaluate.aspx.cs" Inherits="Lecturer_Evaluation_System.evaluate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Evaluation Form</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="student" class="call-to-action section-space-padding text-center home-section"
        style="background: #fafffb">
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <div class="section-title">
                  <h2>Evaluation Form</h2>                       
                </div>
            </div>
            <div class="col-sm-12">
                <asp:Label ID="Label1" runat="server" Text="Label">Lecturer Name:</asp:Label>
                <asp:Label ID="LabelLecturer" runat="server" ></asp:Label>
            </div>

            <div class="col-sm-6">
                <asp:Label ID="Label2" runat="server" Text="Label">Class:</asp:Label>
                <asp:Label ID="LabelClass" runat="server" ></asp:Label>
            </div>

            <div class="col-sm-6">
                <asp:Label ID="Label4" runat="server" Text="Label">Semester:</asp:Label>
                <asp:Label ID="LabelSemester" runat="server" ></asp:Label>
            </div>
            <div class="col-sm-10 col-sm-offset-1">
                <div class="form-group>
                    
                </div>
            </div>
             
        </div>
    </div>
</section>

</asp:Content>
