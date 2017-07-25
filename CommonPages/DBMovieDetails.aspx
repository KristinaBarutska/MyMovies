<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DBMovieDetails.aspx.cs" Inherits="MovieScrapper.CommonPages.DBMovieDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Test
        </div>
        <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px">
            <Fields>            
            <asp:TemplateField>
                <ItemTemplate>
                  <div id="movieItem"> 
                    <div id="info">
                            <div id="title"><%# Eval("Title") %> (<%# Eval("ReleaseDate") %>)</div>
                            
                            </br></br>
                            <div id="overview">
                                <%# Eval("Overview") %>
                            </div>
                            
                            <br></br>
                            
                        </br>
                    </div>
                    <img id="poster" src="<%# Eval("PosterPath") %> "/>
                      <br />
                      <br />
                      <br />                      
                   </div>
                </ItemTemplate>
            </asp:TemplateField>            

        </Fields>
        </asp:DetailsView>
    </form>
</body>
</html>
