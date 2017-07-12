<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MyMovies.aspx.cs" 
    Inherits="MovieScrapper.Secured.MyMovies" Async="true" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server" >
    
    
    <p>
        &nbsp;</p>
    <p>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
&nbsp;&nbsp;
        <asp:Button ID="SearchButton" runat="server" OnClick="Button1_Click" Text="Search" />
    </p>
    <p>
        <asp:DataList ID="MoviesDataList" runat="server" CellPadding="4" ForeColor="#333333" RepeatColumns="3" RepeatDirection="Horizontal" RepeatLayout="Flow">
            <AlternatingItemStyle BackColor="White" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <ItemStyle BackColor="#E3EAEB" />
            <ItemTemplate>
                 <%# Eval("Title") %>  (<%# Eval("ReleaseDate") %>)
            </ItemTemplate>
            <SelectedItemStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        </asp:DataList>
    </p>
    
    
</asp:Content>
