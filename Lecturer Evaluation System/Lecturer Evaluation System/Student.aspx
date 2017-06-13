<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Student.aspx.cs" Inherits="Lecturer_Evaluation_System.Student" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Student Home</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<section id="student" class="call-to-action section-space-padding text-center home-section"
        style="background: #fafffb">
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
             <div class="section-title">
                        <h2>My Classes</h2>                       
                    </div>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="classID" DataSourceID="SqlDataSource1" CssClass="table table-responsive" OnSelectedIndexChanged="evaluate">
                    <Columns>
                        <asp:BoundField DataField="classID" HeaderText="classID" InsertVisible="False" 
                            ReadOnly="True" SortExpression="classID" />
                        <asp:BoundField DataField="className" HeaderText="className" 
                            SortExpression="className" />
                        <asp:BoundField DataField="semesterID" HeaderText="semesterID" 
                            SortExpression="semesterID" />
                        <asp:BoundField DataField="lecturerID" HeaderText="lecturerID" 
                            SortExpression="lecturerID" />
                        <asp:CommandField CancelText="" DeleteText="" EditText="Evaluate" InsertText="" 
                            NewText="" SelectText="Evaluate" ShowSelectButton="True" UpdateText=""/>
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    SelectCommand="SELECT * FROM [Class]"></asp:SqlDataSource>
            </div>
        </div>
    </div>
</section>
</asp:Content>

