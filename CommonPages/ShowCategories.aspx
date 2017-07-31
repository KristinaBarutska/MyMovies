<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShowCategories.aspx.cs" Inherits="MovieScrapper.CommonPages.ShowCategories" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="ObjectDataSource1"
                ItemType="MovieScrapper.Entities.MovieCategory">
                <ItemTemplate>
                    <asp:Label ID="CategoryTtleLabel" runat="server" Style="text-transform: uppercase;" Text='<%# Item.CategoryTtle %>' />
                    <br />
                    <asp:Label ID="CategoryDescriptionLabel" runat="server" Text='<%# Item.CategoryDescription %>' />
                    <br />

                    <asp:Repeater ID="Repeater2" runat="server"
                        ItemType="MovieScrapper.Entities.Movie" DataSource="<%# Item.Movies %>">
                        <HeaderTemplate>
                            <div>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <div id="movieItem">
                                <div id="title">
                                    <div class="items">
                                        <%# Item.Title %> (<%# DisplayYear(Item.ReleaseDate) %>)
                                    </div>
                                </div>
                                <img id="poster" src="<%# BuildPosterUrl(Item.PosterPath) %>" class="auto-style2" />
                            </div>
                        </ItemTemplate>
                        <FooterTemplate>
                            </div>
                        </FooterTemplate>
                    </asp:Repeater>

                    <asp:DataList ID="DataList1" runat="server" RepeatDirection="Horizontal"
                        CellPadding="4" ForeColor="#333333" DataSource="<%# Item.Movies %>">
                        <AlternatingItemStyle BackColor="White" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <ItemStyle BackColor="#EFF3FB" />
                        <ItemTemplate>
                            <div id="movieItem">
                                <div id="title">
                                    <div class="items">
                                        <%# Eval("Title") %> (<%# DisplayYear((string)Eval("ReleaseDate")) %>)
                                    </div>
                                </div>
                                <img id="poster" src="<%# BuildPosterUrl((string)Eval("PosterPath")) %>" class="auto-style2" />
                            </div>
                        </ItemTemplate>
                    </asp:DataList>

                </ItemTemplate>
            </asp:Repeater>

            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetAll"
                TypeName="MovieScrapper.Business.CategoryService"></asp:ObjectDataSource>

        </div>
    </form>
</body>
</html>
