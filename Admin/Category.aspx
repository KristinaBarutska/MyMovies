<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Category.aspx.cs" Inherits="MovieScrapper.Admin.Category" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:TextBox ID="CategoryTextBox" runat="server" OnTextChanged="CategoryTextBox_TextChanged"></asp:TextBox>
        &nbsp;</div>
        <p>
            <asp:TextBox ID="DescriptionTextBox" runat="server" Height="147px" Width="397px"></asp:TextBox>
        </p>
        <asp:Button ID="SubmitCategoryButton" runat="server" OnClick="SubmitCategoryButton_Click" Text="Submit" />
        <p>
            <asp:Label ID="Label1" runat="server"></asp:Label>
        </p>
    </form>
</body>
</html>
