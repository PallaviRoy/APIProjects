<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ArtistView.aspx.cs" Inherits="AllAboutMusic.View.ArtistView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:TextBox ID="Artistname" runat="server"></asp:TextBox>
        </div>
        
        <asp:Button ID="GetArtist" runat="server" OnClick="GetArtist_Click" Text="Go" />
        <p>
            <asp:TextBox ID="ShowArtist" runat="server" Height="175px" Width="828px" TextMode="MultiLine"></asp:TextBox>
        </p>
    </form>
</body>
</html>
