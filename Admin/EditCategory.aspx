<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditCategory.aspx.cs" Inherits="MovieScrapper.Admin.EditCategory" MasterPageFile="~/Site.Master" %>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    &nbsp;
        <div>
            <asp:TextBox ID="EditCategoryTitleTextBox" runat="server" Width="400px"></asp:TextBox>
            <br /><br />
        </div>
        <asp:TextBox ID="EditCategoryDescriptionTextBox" runat="server" Height="50px" Width="400px"></asp:TextBox>
        <br />
        <p>
            <asp:Button ID="BackButton" runat="server" OnClick="BackButton_Click" Text="Cancel" Width="190px" CssClass="col-md-offset-0" />&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="DeleteCategoryButton" runat="server" OnClick="DeleteCategoryButton_Click" Text="Delete Category" OnClientClick="return confirm('Are you sure you want to delete this item?')" Width="190px"/>
        </p>
        <p>
            <asp:Button ID="SaveChangesButton" runat="server" OnClick="SaveChangesButton_Click" Text="Save changed" Width="400px" />
        </p>      

    </asp:Content>

