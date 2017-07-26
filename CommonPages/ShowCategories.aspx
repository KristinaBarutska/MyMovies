<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShowCategories.aspx.cs" Inherits="MovieScrapper.CommonPages.ShowCategories" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:DataList ID="DataList1" runat="server" DataKeyField="Id" DataSourceID="SqlDataSource1">
                <ItemTemplate>
                    
                    <asp:Label ID="CategoryTtleLabel" runat="server" Text='<%# Eval("CategoryTtle") %>' />
                    <br />
                    
                    <asp:Label ID="CategoryDescriptionLabel" runat="server" Text='<%# Eval("CategoryDescription") %>' />
                    <br />
                    Id:
                    <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                    <br />
<br />
                </ItemTemplate>
            </asp:DataList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT DISTINCT [CategoryTtle], [CategoryDescription], [Id] FROM [MovieCategories]"></asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
