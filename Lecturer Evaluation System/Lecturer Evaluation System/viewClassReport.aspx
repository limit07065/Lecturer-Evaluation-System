<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="viewClassReport.aspx.cs" Inherits="Lecturer_Evaluation_System.viewClassReport" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <section id="Lecturer" class="call-to-action section-space-padding text-center home-section"
        style="background: #fafffb">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                 <div class="section-title">
                        <h2>*Class Name*</h2>                       
                    </div>
                    <div class="col-sm-6">
                        <asp:Chart ID="Chart1" runat="server" AlternateText="Chart for number of students who haven't rate">
                                <Series>
                                    <asp:Series Name="Series1" ChartType="Pie">
                                    </asp:Series>
                                </Series>
                                <ChartAreas>
                                    <asp:ChartArea Name="ChartArea1">
                                    </asp:ChartArea>
                                </ChartAreas>
                            </asp:Chart>
                            <p>
                                Total Students: <asp:Label runat="server" ID="Label1"></asp:Label>
                            </p>

                    </div>
                        
                    <div class="col-sm-6">
                    <h3>Student Comment</h3>
                    <hr />
                     <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table table-responsive">
                            <Columns>
                                <asp:TemplateField HeaderText="No">
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex + 1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="Comment" HeaderText="Comment(s)" InsertVisible="False"
                                    ReadOnly="True" SortExpression="Comment" />
                            </Columns>
                        </asp:GridView>
                    
                    </div>
                       
                    </div>
                </div>
            </div>
      </section>
</asp:Content>
