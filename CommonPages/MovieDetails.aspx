﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MovieDetails.aspx.cs" Inherits="MovieScrapper.MovieDetails" Async="true"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="MovieDetail.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        
        <asp:DetailsView ID="DetailsView1" runat="server" Height="157px"  Width="279px" AutoGenerateRows="false" BorderStyle="None" >
        <Fields>            
            <asp:TemplateField>
                <ItemTemplate>
                  <div id="movieItem"> 
                    <div id="info">
                            <div id="title"><%# Eval("Title") %> (<%# DisplayYear((string)Eval("ReleaseDate")) %>)</div>
                            
                            </br></br>
                            <div id="overview">
                                <%# Eval("Overview") %>
                            </div>
                            
                            <br></br>
                            <a id="backlLink" runat="server" href="<%# BuildBackUrl() %>">Back to search page</a> </br>
                        </br>
                    </div>
                    <img id="poster" src="<%# BuildPosterUrl((string)Eval("PosterPath")) %> "/>
                      <br />
                      <br />
                      <br />                      
                   </div>
                </ItemTemplate>
            </asp:TemplateField>            

        </Fields>  
        </asp:DetailsView>
        <p>
            <asp:Button ID="AddMovieToCategoryButton" runat="server" Height="40px" Text="Add this movie to the selected category "  Width="527px" OnClick="AddMovieToCategoryButton_Click" />
        </p>
        <%--<asp:Label ID="Label1" runat="server" Text=""></asp:Label>
        <br />
        <asp:Label ID="Label2" runat="server" Text=""></asp:Label>--%>
    </form>
</body>
</html>
