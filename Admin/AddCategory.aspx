﻿
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddCategory.aspx.cs" Inherits="MovieScrapper.Admin.Category" MasterPageFile="~/Site.Master" %>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <br />
    <hr />
        <div>
            Title:
            <br />
            <asp:TextBox ID="CategoryTextBox" runat="server"  Width="400px"></asp:TextBox>
            <asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server"
                ControlToValidate="CategoryTextBox"
                ErrorMessage="Category title is a required field."
                ForeColor="Red">
</asp:RequiredFieldValidator>
            <br />
            Description:
        </div>
        <p>
            <asp:TextBox ID="DescriptionTextBox" runat="server" Height="150px" Width="400px"></asp:TextBox>
        </p>
        <asp:Button ID="SubmitCategoryButton" runat="server" OnClick="SubmitCategoryButton_Click" Text="Submit" Height="25px" Width="103px" />
        &nbsp;
        <asp:Button ID="BackToCategoriesButton" runat="server" OnClick="BackToCategoriesButton_Click" Text="Cancel" Width="100px" Height="25px" />
        <p>
            <asp:Label ID="Label1" runat="server"></asp:Label>
        </p>
</asp:Content>
