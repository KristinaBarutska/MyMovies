<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MyMovies.aspx.cs" 
    Inherits="MovieScrapper.Secured.MyMovies" Async="true" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server" >
    <link href="MovieStyleSheet.css" rel="stylesheet" />
    <p>
        &nbsp;</p>
    <p>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
&nbsp;&nbsp;
        <asp:Button ID="SearchButton" runat="server" OnClick="Button1_Click" Text="Search" />
    </p>
    <p>
        <asp:DataList ID="MoviesDataList" runat="server" RepeatColumns="3" RepeatDirection="Horizontal" RepeatLayout="Flow" OnSelectedIndexChanged="MoviesDataList_SelectedIndexChanged">
            <ItemTemplate>
              <div id="movieItem">  
                  <div id="title"><%# Eval("Title") %> (<%# DisplayYear((string)Eval("ReleaseDate")) %>)</div>  
                  <img id="poster" src=<%# BuildUrl((string)Eval("PosterPath")) %> />                                 
                  <a runat="server" href=<%# BuildUrlWithId((string)Eval("Id")) %>>Details</a>
              </div>
            </ItemTemplate>
        </asp:DataList>
    </p>
    
    
</asp:Content>
