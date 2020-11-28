<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="WebForm3.aspx.cs" Inherits="Lab_3.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
            <asp:BoundField DataField="car" HeaderText="car" SortExpression="car" />
            <asp:BoundField DataField="obj_from" HeaderText="obj_from" SortExpression="obj_from" />
            <asp:BoundField DataField="obj_to" HeaderText="obj_to" SortExpression="obj_to" />
            <asp:BoundField DataField="date_from" HeaderText="date_from" SortExpression="date_from" />
            <asp:BoundField DataField="date_to" HeaderText="date_to" SortExpression="date_to" />
            <asp:BoundField DataField="hours" HeaderText="hours" SortExpression="hours" ReadOnly="True" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:autoConnectionString %>" SelectCommand="SELECT        dbo.trips.id, dbo.cars.name AS car, dbo.objects.name AS obj_from, objects_1.name AS obj_to, dbo.trips.date_from, dbo.trips.date_to, DATEDIFF(hh, dbo.trips.date_from, dbo.trips.date_to) AS hours
FROM            dbo.trips INNER JOIN
                         dbo.objects ON dbo.trips.object_form_id = dbo.objects.id INNER JOIN
                         dbo.objects AS objects_1 ON dbo.trips.object_to_id = objects_1.id INNER JOIN
                         dbo.cars ON dbo.trips.car_id = dbo.cars.id"></asp:SqlDataSource>
    <p>
    </p>
</asp:Content>
