<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LyricsView.aspx.cs" Inherits="AllAboutMusic.View.LyricsView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <h1>Enter Both Artist Name and Song to get the lyrics</h1>
    <form id="form1" runat="server">
        <div>
            <asp:textbox ID="artistName" runat="server" placeholder="Enter Artist Name"/>
            <asp:TextBox ID="songName" runat="server" placeholder="Enter Song"/>
        </div>
        <p>
        <asp:Button ID="GetLyrics" runat="server" OnClick="GetLyrics_Click" Text="Get Lyrics" />
        </p>
        <p>
        <asp:TextBox ID="LyricsShow" runat="server" Height="196px" Width="787px"></asp:TextBox>
        </p>
    </form>
</body>
</html>
