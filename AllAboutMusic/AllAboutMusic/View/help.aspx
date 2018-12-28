<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="AllAboutMusic.View.About" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://unpkg.com/flickity@2/dist/flickity.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.15/css/mdb.min.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link rel="stylesheet" href="../Content/album.css" />
    <link rel="stylesheet" href="../Content/help.css" />
    <title>HELP</title>
</head>
<body>
<!-- NAVBAR START -->
<div class="view">
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

    <div class="helpcontent">
    <h3>Follow below steps to use our application</h3>
        <ul>
            <li>
                Enter your favorite musician in the search artist field
            </li>
            <li>
                A list of artists with that name would be diplayed. Select the albums of the artist of your choice
            </li>
            <li>
                Know more about the tracks in an album of your musician
            </li>
        </ul>
    </div>
    </div>

<!-- NAVBAR END -->
    
    <form id="form1" runat="server">
        <div>
        </div>
    </form>
<!--FOOTER START-->
  <div id="footer">
    <div class="container">
      <p class="footer-block">Copyright &copy All About Music USA, Inc. All Rights Reserved.</p>
    </div>
  </div>
<!--FOOTER END-->
</body>
</html>
