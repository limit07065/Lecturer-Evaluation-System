<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Student.aspx.cs" Inherits="Lecturer_Evaluation_System.Student" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Student Home</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="classID" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="classID" HeaderText="classID" InsertVisible="False" 
                ReadOnly="True" SortExpression="classID" />
            <asp:BoundField DataField="className" HeaderText="className" 
                SortExpression="className" />
            <asp:BoundField DataField="semesterID" HeaderText="semesterID" 
                SortExpression="semesterID" />
            <asp:BoundField DataField="lecturerID" HeaderText="lecturerID" 
                SortExpression="lecturerID" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT * FROM [Class]"></asp:SqlDataSource>
</asp:Content>

