﻿<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true"
    CodeBehind="Admin.aspx.cs" Inherits="Lecturer_Evaluation_System.Admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid padding-top-30">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
            <ContentTemplate>
                <div class="col-sm-3 pull-left ">
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1"
                        DataTextField="semesterName" DataValueField="semesterID" AutoPostBack="True"
                        OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" OnDataBound="DropDownList1_DataBound">
                    </asp:DropDownList>
                </div>
                <div id="activationDiv" class="col-sm-3 pull-right" runat="server">
                </div>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                    SelectCommand="SELECT [semesterID], [semesterName] FROM [Semester]"></asp:SqlDataSource>
                <div class="col-sm-12 padding-top-20">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" ShowHeaderWhenEmpty="True"
                        EmptyDataText="<center>Select semester to view</center>" BackColor="White" BorderColor="#CCCCCC"
                        BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
                        <Columns>
                            <asp:TemplateField HeaderText="Class Name">
                                <ItemTemplate>
                                    <a href='<%# DataBinder.Eval(Container.DataItem, "classID", "viewClassReport.aspx?classID={0}") %>'>
                                        <%# DataBinder.Eval(Container.DataItem, "className") %></a>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="averageMarks" HeaderText="Marks" InsertVisible="False"
                                ReadOnly="True" SortExpression="averageMarks" />
                            <asp:BoundField DataField="totalRated" HeaderText="Number of student rated" InsertVisible="False"
                                ReadOnly="True" SortExpression="totalRated" />
                            <asp:BoundField DataField="totalEnrolled" HeaderText="Number of student enrolled"
                                InsertVisible="False" ReadOnly="True" SortExpression="totalEnrolled" />
                        </Columns>
                        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F7F7F7" />
                        <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                        <SortedDescendingCellStyle BackColor="#E5E5E5" />
                        <SortedDescendingHeaderStyle BackColor="#242121" />
                    </asp:GridView>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
