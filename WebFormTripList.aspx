<%@ Page Title="" Language="C#" MasterPageFile="~/Site2(Lab4).Master" AutoEventWireup="true" CodeBehind="WebFormTripList.aspx.cs" Inherits="Lab_3.WebFormTripList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="container ml-2">
        <form class="row" action="/" method="post">
              <div class="form-row">
                <div class="col-md-5 mb-3">
                  <label for="validationCustom01">Date From</label>
                  <asp:TextBox ID="dateFrom" type="date" class="form-control" runat="server" placeholder="Date From" name="date_from" value=""  />
                  <div class="valid-feedback">
                    Looks good!
                  </div>
                </div>
                <div class="col-md-5 mb-3">
                  <label for="validationCustom02">Date To</label>
                  <asp:TextBox ID="dateTo" type="date" class="form-control" runat="server" placeholder="Date To" name="date_to" value=""  />
                  <div class="valid-feedback">
                    Looks good!
                  </div>
                </div>
                <div class="col-md-2 mb-3">
                    <asp:Button runat="server" class="btn btn-primary" Text="Get Data" OnClick="GetData_Click" style="position: absolute; bottom: 0;"/>
                </div>
              </div>
        </form>
        <asp:GridView ID="GridView1" runat="server" class="row" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:TemplateField HeaderText="" ItemStyle-Width="10">                    
                    <ItemTemplate>                       
                        <asp:CheckBox ID="CheckBox1" runat="server" data-value='<%# Eval("id") %>' OnCheckedChanged="CheckBox1_CheckedChanged"  />
                    </ItemTemplate>
                    <HeaderStyle BorderStyle="Solid" HorizontalAlign="Center" VerticalAlign="Middle" BorderColor="Black" BorderWidth="1px" ForeColor="Black" />

                    <ItemStyle Width="50px" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
               </asp:TemplateField>  

                <asp:TemplateField HeaderText="ID" ItemStyle-Width="50">
                    <ItemTemplate>
                        <asp:Label id="id" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle BorderStyle="Solid" HorizontalAlign="Center" VerticalAlign="Middle" BorderColor="Black" BorderWidth="1px" ForeColor="Black" />
                    <ItemStyle Width="50px" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>                    
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Car" ItemStyle-Width="50">
                    <ItemTemplate>
                        <asp:Label  runat="server" Text='<%# Eval("car") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle BorderStyle="Solid" HorizontalAlign="Center" VerticalAlign="Middle" BorderColor="Black" BorderWidth="1px" ForeColor="Black" />
                    <ItemStyle Width="50px" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>                    
                </asp:TemplateField>

                
                <asp:TemplateField HeaderText="Object Form" ItemStyle-Width="50">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# Eval("obj_from") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle BorderStyle="Solid" HorizontalAlign="Center" VerticalAlign="Middle" BorderColor="Black" BorderWidth="1px" ForeColor="Black" />
                    <ItemStyle Width="50px" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>                    
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Object To" ItemStyle-Width="50">
                    <ItemTemplate>
                        <asp:Label  runat="server" Text='<%# Eval("obj_to") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle BorderStyle="Solid" HorizontalAlign="Center" VerticalAlign="Middle" BorderColor="Black" BorderWidth="1px" ForeColor="Black" />
                    <ItemStyle Width="50px" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>                    
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Date From" ItemStyle-Width="50">
                    <ItemTemplate>
                        <asp:Label  runat="server" Text='<%# Eval("date_from") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle BorderStyle="Solid" HorizontalAlign="Center" VerticalAlign="Middle" BorderColor="Black" BorderWidth="1px" ForeColor="Black" />
                    <ItemStyle Width="50px" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>                    
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Date To" ItemStyle-Width="50">
                    <ItemTemplate>
                        <asp:Label  runat="server" Text='<%# Eval("date_to") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle BorderStyle="Solid" HorizontalAlign="Center" VerticalAlign="Middle" BorderColor="Black" BorderWidth="1px" ForeColor="Black" />
                    <ItemStyle Width="50px" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>                    
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Time (hours)" ItemStyle-Width="50">
                    <ItemTemplate>
                        <asp:Label  runat="server" Text='<%# Eval("hours") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle BorderStyle="Solid" HorizontalAlign="Center" VerticalAlign="Middle" BorderColor="Black" BorderWidth="1px" ForeColor="Black" />
                    <ItemStyle Width="50px" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>                    
                </asp:TemplateField>
            </Columns>
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
        </asp:GridView>
        <asp:Button runat="server" class="btn btn-danger mt-2" Text="Delete" OnClick="Delete_Click" />
    </div>
</asp:Content>
