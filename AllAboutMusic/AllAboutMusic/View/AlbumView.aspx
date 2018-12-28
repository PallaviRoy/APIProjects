<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AlbumView.aspx.cs" Inherits="AllAboutMusic.View.AlbumView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://unpkg.com/flickity@2/dist/flickity.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.15/css/mdb.min.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link rel="stylesheet" href="../Content/album.css" />
    <link rel="stylesheet" href="../Content/mobile.css" media="only screen and (max-width: 480px)"/>
    <title>Search Song Lyrics</title>
</head>
<body>
    <!-- NAVBAR START -->
    <div class="view" style="background-image: url('../Images/black.jpg'); background-repeat: no-repeat; background-size: cover; background-position: center center;">
        <div class="logo-div">
            <div class="btn-container">
                <div class="menu-btn top"></div>
                <div class="menu-btn center"></div>
                <div class="menu-btn bottom"></div>
            </div>
        </div>

        <nav class="my-nav">
            <ul>
                <li><a href="AlbumView.aspx">Home</a></li>
                <li><a href="About.aspx">About</a></li>
                <li><a href="help.aspx">Help</a></li>
                <li><a href="ReviewInput.aspx">Review</a></li>
                <li><a href="#">ALL ABOUT MUSIC</a></li>
            </ul>
        </nav>
    </div>

    <!-- NAVBAR END -->
    <!-- CAROUSEL START -->
    <div class="carousel js-flickity" data-flickity='{ "autoPlay": true }'>
        <div class="carousel-cell">
            <img src="../Images/mj.jpg" alt="michael jackson" />
        </div>
        <div class="carousel-cell">
            <img src="../Images/music.jpg" alt="music" />
        </div>
        <div class="carousel-cell">
            <img src="../Images/stars.jpg" alt="all stars" />
        </div>
        <div class="carousel-cell">
            <img src="../Images/edm.jpg" alt="edm crowd" />
        </div>
        <div class="carousel-cell">
            <img src="../Images/dj.jpg" alt="disk jockey" />
        </div>
        <div class="carousel-cell">
            <img src="../Images/mike.jpg" alt="mike" />
        </div>
    </div>
    <!-- CAROUSEL END -->
    <div class="view" style="background-image: url('../Images/guitar.jpg'); background-repeat: no-repeat; background-size: cover; background-position: center center;">
        <div class="d-flex justify-content-center align-items-center container">
            <form id="search" runat="server" class="form-inline">
                <div class="row">
                    <div class="col-12">
                        <h1>Search Song Lyrics</h1>
                        <div>
                            <asp:TextBox ID="Artistname" class="form-control" runat="server" placeholder="Enter Artist Name" CssClass="wide"></asp:TextBox>

                            <asp:Button ID="GetArtist" class="btn aqua-gradient btn-rounded btn-sm my-0" runat="server" OnClick="GetArtist_Click" Text="Search Songs"  />
                            <asp:Button ID="ArtistReset" class="btn aqua-gradient btn-rounded btn-sm my-0" runat="server" OnClick="ArtistReset_Click" Text="Clear" />
                            <br />
                            <br />
                            <asp:TextBox ID="SongName" class="form-control" runat="server" placeholder="Enter Song Name" CssClass="wide"/>

                            <asp:Button ID="GetLyrics" class="btn aqua-gradient btn-rounded btn-sm my-0" runat="server" OnClick="GetLyrics_Click" Text="Search Lyrics" />
                            <asp:Button ID="SongReset"  class="btn aqua-gradient btn-rounded btn-sm my-0" runat="server" OnClick="SongReset_Click" Text="Clear"  />
                            <br />
                        </div>
                    </div>
                </div>


                <br />
                <asp:TextBox ID="ShowLyrics" runat="server" Height="309px" Width="985px" placeholder="Lyrics" TextMode="MultiLine"></asp:TextBox>
                <br />

                <asp:Repeater ID="artistrep" runat="server" OnItemCommand="artistrep_ItemCommand">
                    <HeaderTemplate>
                        <table class="table table-striped table-dark">
                            <thead>
                                <tr>
                                    <th>Artists</th>
                                    <th>Rating</th>
                                    <th>Country</th>
                                    <th></th>
                                </tr>
                            </thead>
                    </HeaderTemplate>

                    <ItemTemplate>
                        <tr>
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
                                <asp:Button ID="GetAlbum" class="btn aqua-gradient btn-rounded btn-sm my-0" runat="server" Text="Albums" CommandArgument='<%# DataBinder.Eval(Container, "DataItem.artist_id")%>' />
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>

                <asp:Repeater ID="albumrep" runat="server" OnItemCommand="albumrep_ItemCommand">
                    <HeaderTemplate>
                        <table class="table table-striped table-dark">
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
                                <asp:Button ID="GetTracks" class="btn aqua-gradient btn-rounded btn-sm my-0" runat="server" Text="Tracks" CommandArgument='<%# DataBinder.Eval(Container, "DataItem.album_id")%>' />
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>

                <asp:Repeater ID="trackrep" runat="server" OnItemCommand="trackrep_ItemCommand">
                    <HeaderTemplate>
                        <table class="table table-striped table-dark">
                            <tr>
                                <th>Track Name</th>
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
                                <%# DataBinder.Eval(Container, "DataItem.artist_name")%>
                        </td>
                            <td>
                                <%# DataBinder.Eval(Container, "DataItem.track_rating")%>
                        </td>
                            <td>
                                <asp:Button ID="FetchLyrics" class="btn aqua-gradient btn-rounded btn-sm my-0" runat="server" Text="Lyrics" CommandArgument='<%# DataBinder.Eval(Container, "DataItem.artist_name")+","+ DataBinder.Eval(Container, "DataItem.track_name")%>' />
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </form>
        </div>
    </div>
    <!--FOOTER START-->
  <!--<footer>
     <div id="footer">
        <div class="container">
          <p class="footer-block">Copyright &copy All About Music USA, Inc. All Rights Reserved.</p>
        </div>
    </div>
  </footer>-->
    <!--FOOTER END-->
        
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="https://unpkg.com/flickity@2/dist/flickity.pkgd.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.15/js/mdb.min.js"></script>
    <script src="../carousel.js"></script>
    <p class="text-center">
        &nbsp;
    </p>
</body>
</html>
