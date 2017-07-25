<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GetCategory.aspx.cs" Inherits="MovieScrapper.Admin.GetCategory" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal"
                OnItemCommand="DataList1_ItemCommand">
                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                <ItemTemplate>
                    Ttle:
                    <asp:Label ID="CategoryTtleLabel" runat="server" Text='<%# Eval("CategoryTtle") %>' />
                    <br />
                    <br />
                    Description:
                    <asp:Label ID="CategoryDescriptionLabel" runat="server" Text='<%# Eval("CategoryDescription") %>' />
                    <br />
                    <br />
                    <asp:Button runat="server" ID="EditCategory" OnClick="EditCategoryButton_Click" Text="Edit category name or description" 
                        CommandName="EditCategory" CommandArgument='<%# Eval("Id") %>' Width="240px" />
                    <br />
                    <br />
                    <asp:Button ID="ShowMoviesInThisCategoryButton" runat="server" CommandName="EditMoviesInThisCategory"
                        CommandArgument='<%# Eval("Id") %>' Text="Edit movies in this category" Width="240px" />
                    <br />
                    <br />
                </ItemTemplate>
                <SelectedItemStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
            </asp:DataList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MovieScrapper.Models.MovieContextConnectionString %>" SelectCommand="SELECT DISTINCT [CategoryTtle], [CategoryDescription], [Id] FROM [MovieCategories]"></asp:SqlDataSource>
            <br />
        </div>
        <hr />
        <asp:Button ID="AddCategoryButton" runat="server" OnClick="AddCategoryButton_Click" Text="Add new category" Width="240px" />
    </form>
</body>
</html>
