<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditCategory.aspx.cs" Inherits="MovieScrapper.Admin.EditCategory" MasterPageFile="~/Site.Master" %>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
  <br />
    <hr />
    <div  style:"width: 400px; border:1px soled gray;">
        <div>
            <asp:TextBox ID="EditCategoryTitleTextBox" runat="server" Width="100%"></asp:TextBox>
            <br /><br />
        </div>
        <asp:TextBox ID="EditCategoryDescriptionTextBox" runat="server" Height="50px" Width="100%"></asp:TextBox>
        <br />
        <br />
        <p>
            <asp:Button ID="BackButton" runat="server" OnClick="BackButton_Click" Text="Cancel" Width="125px" CssClass="col-md-offset-0" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="DeleteCategoryButton" runat="server" OnClick="DeleteCategoryButton_Click" Text="Delete Category" OnClientClick="return confirm('Are you sure you want to delete this item?')" Width="125px"/>
        </p>
        <p>
            <asp:Button ID="SaveChangesButton" runat="server" OnClick="SaveChangesButton_Click" Text="Save changed" Width="275px" />
        </p>      
    </div>
</asp:Content>

