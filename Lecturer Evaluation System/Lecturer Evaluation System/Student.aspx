<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true"
    CodeBehind="Student.aspx.cs" Inherits="Lecturer_Evaluation_System.Student" %>

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
                    <h2>
                        My Classes
                    </h2>                           
            </div>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="classID"  CssClass="table table-responsive" OnSelectedIndexChanged="evaluate" >
                    <Columns>
                        
                        <asp:TemplateField>
                            <ItemTemplate>
                                 <%#Container.DataItemIndex+1 %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="className" HeaderText="Class" InsertVisible="False"
                                ReadOnly="True" SortExpression="averageMarks" />
                        <asp:BoundField DataField="lecturer" HeaderText="Lecturer" InsertVisible="False"
                                ReadOnly="True" SortExpression="averageMarks" />
                        <asp:BoundField DataField="semester" HeaderText="Semester" InsertVisible="False"
                             ReadOnly="True" SortExpression="averageMarks" />
                       
                        <asp:CommandField ShowSelectButton="True" SelectText="Evaluate" />
                    </Columns>
                </asp:GridView>
                
            </div>
        </div>
    </div>
</section>
</asp:Content>
