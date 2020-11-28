<%@ Page Title="" Language="C#" MasterPageFile="~/Site2(Lab4).Master" AutoEventWireup="true" CodeBehind="WebFormAddTrip.aspx.cs" Inherits="Lab_3.WebFormAddTrip" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row ml-2">
            <div>
              <div class="form-group">
                <label>Car</label>
                <asp:DropDownList class="form-control" ID="DropDownListCars" runat="server"></asp:DropDownList>
              </div>
              <div class="form-group">
                <label>Object From</label>
                <asp:DropDownList class="form-control" ID="DropDownListObjects1" runat="server"></asp:DropDownList>
              </div>
              <div class="form-group">
                <label>Object To</label>
                <asp:DropDownList class="form-control" ID="DropDownListObjects2" runat="server"></asp:DropDownList>
                <label>
                    <asp:Label ID="ObjLabel" runat="server" Text="Objects must be different"></asp:Label>
                </label>
              </div>
              <div class="form-group">
                <label>Date From</label>
                <asp:TextBox class="form-control" runat="server" ID="dateFrom" type="date" required></asp:TextBox>
                
              </div>
              <div class="form-group">
                <label>Date To</label>
                <asp:TextBox class="form-control" runat="server" ID="dateTo" type="date" required></asp:TextBox>
                
                <label>
                    <asp:Label ID="DateLabel" runat="server" Text="Date To must be more than Date From"></asp:Label>
                </label>
              </div>
              <asp:Button runat="server" class="btn btn-primary" Text="Add" OnClick="Add_Click" />
            </div>
        </div>
    </div>
</asp:Content>
