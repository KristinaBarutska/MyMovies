<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditCategory.aspx.cs" Inherits="MovieScrapper.Admin.EditCategory" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:TextBox ID="EditCategoryTitleTextBox" runat="server" Width="400px"></asp:TextBox>
            <br /><br />
        </div>
        <asp:TextBox ID="EditCategoryDescriptionTextBox" runat="server" Height="50px" Width="400px"></asp:TextBox>
        <p>
            <asp:Button ID="SaveChangesButton" runat="server" OnClick="SaveChangesButton_Click" Text="Save changed" />
        </p>
    </form>
</body>
</html>
