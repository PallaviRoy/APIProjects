<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AlbumView.aspx.cs" Inherits="AllAboutMusic.View.AlbumView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="~/wwwroot/lib/bootstrap/dist/css/bootstrap.css" />
    <title></title>
</head>
<body>
    <h1>Search Song Lyrics</h1>
    <h4>Enter Artist OR Enter Both Artist and Song</h4>
     <form id="search" runat="server">
        <div>
            <label>Enter Artist</label>
            <asp:TextBox ID="Artistname" runat="server" placeholder="Artist Name"></asp:TextBox>
        
            <asp:Button ID="GetArtist" runat="server" OnClick="GetArtist_Click" Text="Search Songs" />
            <br />
            <label>Enter Song</label>
            <asp:TextBox ID = "SongName" runat = "server" placeholder = "Song" />
     
            <asp:Button ID = "GetLyrics" runat = "server" OnClick = "GetLyrics_Click" Text = "Get Lyrics" />
        </div>
        <p>
            <asp:TextBox ID="ShowLyrics" runat="server" Height="175px" Width="828px" placeholder="Lyrics" TextMode="MultiLine"></asp:TextBox>
        </p>

         <div>
            <asp:Repeater id="artistrep" runat="server" OnItemCommand="artistrep_ItemCommand">
                <HeaderTemplate>
                    <table class="table">
                    <thead>
                    <tr>
                        <th>Artist ID</th>
                        <th>Name</th>
                        <th>Rating</th>
                        <th>Country</th>
                        <th></th>
                    </tr>
                    </thead>
                </HeaderTemplate>

                <ItemTemplate>
                    <tr>
                        <td>
                        <%# DataBinder.Eval(Container, "DataItem.artist_id")%>
                        </td>
                        <td>
                        <%# DataBinder.Eval(Container, "DataItem.artist_name")%>
                        </td>
                        <td>
                        <%# DataBinder.Eval(Container, "DataItem.artist_rating")%>
                        </td>
                        <td>
                        <%# DataBinder.Eval(Container, "DataItem.artist_country")%>
                        </td>
                        <td>
                            <asp:Button ID="GetAlbum" runat="server" Text="Albums" CommandArgument='<%# DataBinder.Eval(Container, "DataItem.artist_id")%>'/>
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
        </div>

         <div>
            <asp:Repeater id="albumrep" runat="server" OnItemCommand="albumrep_ItemCommand">
                <HeaderTemplate>
                    <table class="table">
                    <tr>
                        <th>Album Name</th>
                        <th>Rating</th>
                        <th>No Of Tracks</th>
                        <th></th>
                    </tr>
                </HeaderTemplate>

                <ItemTemplate>
                    <tr>
                        <td>
                        <%# DataBinder.Eval(Container, "DataItem.album_name")%>
                        </td>
                        <td>
                        <%# DataBinder.Eval(Container, "DataItem.album_rating")%>
                        </td>
                        <td>
                        <%# DataBinder.Eval(Container, "DataItem.album_track_count")%>
                        </td>
                        <td>
                            <asp:Button ID="GetTracks" runat="server" Text="Tracks" CommandArgument='<%# DataBinder.Eval(Container, "DataItem.album_id")%>'/>
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
        </div>

         <div>
            <asp:Repeater id="trackrep" runat="server" OnItemCommand="trackrep_ItemCommand">
                <HeaderTemplate>
                    <table class="table">
                    <tr>
                        <th>Track Name</th>
                        <th>Track Id</th>
                        <th>Artist Name</th>
                        <th>Rating</th>
                        <th></th>
                    </tr>
                </HeaderTemplate>

                <ItemTemplate>
                    <tr>
                        <td>
                        <%# DataBinder.Eval(Container, "DataItem.track_name")%>
                        </td>
                        <td>
                        <%# DataBinder.Eval(Container, "DataItem.track_id")%>
                        </td>
                        <td>
                        <%# DataBinder.Eval(Container, "DataItem.artist_name")%>
                        </td>
                        <td>
                        <%# DataBinder.Eval(Container, "DataItem.track_rating")%>
                        </td>
                        <td>
                            <asp:Button ID="FetchLyrics" runat="server" Text="Lyrics" CommandArgument='<%# DataBinder.Eval(Container, "DataItem.artist_name")+","+ DataBinder.Eval(Container, "DataItem.track_name")%>'/>
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </form>
</body>
</html>
