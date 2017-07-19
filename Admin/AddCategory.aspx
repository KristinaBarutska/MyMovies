﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddCategory.aspx.cs" Inherits="MovieScrapper.Admin.Category" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Category title:<br />
            <asp:TextBox ID="CategoryTextBox" runat="server" OnTextChanged="CategoryTextBox_TextChanged" Width="400px"></asp:TextBox>
        &nbsp;
            <br />
            <br />
            Description:</div>
        <p>
            <asp:TextBox ID="DescriptionTextBox" runat="server" Height="147px" Width="400px"></asp:TextBox>
        </p>
        <asp:Button ID="SubmitCategoryButton" runat="server" OnClick="SubmitCategoryButton_Click" Text="Submit" Height="50px" Width="400px" />
        <p>
            <asp:Label ID="Label1" runat="server"></asp:Label>
        </p>
        <asp:Button ID="BackToShowCategoriesButton" runat="server" OnClick="BackToShowCategoriesButton_Click" Text="Back to show categories" Width="400px" />
    </form>
</body>
</html>
