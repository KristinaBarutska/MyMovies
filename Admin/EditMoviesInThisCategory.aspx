<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditMoviesInThisCategory.aspx.cs" Inherits="MovieScrapper.Admin.EditMoviesInThisCategory" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script src="../Scripts/WebForms/UserDeleteConfirmation.js"></script>
    <title></title>
    <link href="../CommonPages/MovieStyleSheet.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .auto-style2 {
            width: 73%;
            height: 103px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="CategoryTitle" runat="server"></asp:Label>
            <asp:Button ID="BackToEditCategoriesButton" runat="server" Text="Back to edit categories" OnClick="BackToEditCategoriesButton_Click" />
        </div>
        <hr />       
        <asp:DataList ID="DataList1" runat="server" RepeatColumns="4" RepeatDirection="Horizontal" BorderColor="Gray" BorderWidth="1px" CellSpacing="5" 
            OnItemCommand="DataList1_ItemCommand">
            <ItemTemplate>
                <div id="movieItem">  
                  <div id="title">
                      <div class="items">
                      <%# Eval("Title") %> (<%# DisplayYear((string)Eval("ReleaseDate")) %>)
                      </div>
                      <div class="items">
                      <asp:Button ID="DeleteButton" runat="server" CssClass="items" Height="30px" Text="Delete" Width="100px" 
                          CommandName="Delete" CommandArgument='<%# Eval("Id") %>'  OnClientClick="if ( ! UserDeleteConfirmation()) return false;"/>
                     </div>
                      <div class="items">
                      <asp:Button ID="ShowDetailsButton" runat="server" Text="Show details" Width="100px" 
                          CommandName="ShowDetails" CommandArgument='<%# Eval("Id") %>' CssClass="items" Height="30px" />
                        </div>                   
                  </div>  
                    &nbsp;<img id="poster" src="<%# BuildPosterUrl((string)Eval("PosterPath")) %>" class="auto-style2" /></div>
            </ItemTemplate>
        </asp:DataList>
        <hr />
        <asp:Button ID="AddMovieToThiscategoryButton" runat="server" OnClick="AddMovieToThisCategoryButton_Click" Text="Add movie to this category" Width="282px" />

        <br />
        <br />

    </form>
</body>
</html>
