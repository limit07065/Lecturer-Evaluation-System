<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true"
    CodeBehind="Lecturer.aspx.cs" Inherits="Lecturer_Evaluation_System.Lecturer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="lecturer" class="call-to-action section-space-padding text-center home-section"
        style="background: #fafffb">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                 <div class="section-title">
                        <h2>Student Evaluation</h2>                       
                    </div>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table table-responsive">
                        <Columns>
                            <asp:TemplateField HeaderText="Class Name">
                                <ItemTemplate>
                                    <a href='<%# DataBinder.Eval(Container.DataItem, "classID", "viewClassReport.aspx?classID={0}") %>'><%# DataBinder.Eval(Container.DataItem, "className") %></a>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Marks">
                                <ItemTemplate>
                                    <%# DataBinder.Eval(Container.DataItem, "averageMarks", "{0: 0.00}")%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="totalRated" HeaderText="Number of student rated" InsertVisible="False"
                                ReadOnly="True" SortExpression="totalRated" />
                            <asp:BoundField DataField="totalEnrolled" HeaderText="Number of student enrolled"
                                InsertVisible="False" ReadOnly="True" SortExpression="totalEnrolled" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
