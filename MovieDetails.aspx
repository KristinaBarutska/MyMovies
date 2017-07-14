<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MovieDetails.aspx.cs" Inherits="MovieScrapper.MovieDetails" Async="true"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="MovieDetail.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        
        <asp:DetailsView ID="DetailsView1" runat="server" Height="85px" 
            OnPageIndexChanging="DetailsView1_PageIndexChanging" Width="255px"
            AutoGenerateRows="false" BorderStyle="None" >
        <Fields>            
            <asp:TemplateField>
                <ItemTemplate>
                  <div id="movieItem"> 
                    <div id="info">
                            <div id="title"><%# Eval("Title") %> (<%# DisplayYear((string)Eval("ReleaseDate")) %>)</div>
                        </br>
                        <div id="overview"><%# Eval("Overview") %></div>
                        </br>
                        <a id="backlLink" runat="server" href="<%# BuildBackUrl() %>">Back to search page</a>
                    </div>
                    <img id="poster" src="<%# BuildUrl((string)Eval("PosterPath")) %> "/>
                   </div>
                </ItemTemplate>
            </asp:TemplateField>            

        </Fields>  
        </asp:DetailsView>
        
    </form>
</body>
</html>
