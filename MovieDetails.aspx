<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MovieDetails.aspx.cs" Inherits="MovieScrapper.MovieDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <p>
            Movie details</p>
        <p>
            <asp:DetailsView ID="MovieDetailsView" runat="server" Height="50px" OnPageIndexChanging="MovieDetailsView_PageIndexChanging" Width="125px">
            </asp:DetailsView>
        </p>
    </form>
</body>
</html>
