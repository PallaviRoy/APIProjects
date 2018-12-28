<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReviewInput.aspx.cs" Inherits="ProduceFinalXML.View.Rating" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://unpkg.com/flickity@2/dist/flickity.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.15/css/mdb.min.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link rel="stylesheet" href="../Content/album.css" />
    <title>Review</title>
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
    <div class="view" style="background-image: url('../Images/black.jpg'); background-repeat: no-repeat; background-size: cover; background-position: center center;">
    <div class="d-flex justify-content-left align-items-center container">
    <form id="form1" runat="server">
        <asp:Label ID="RatingTitle" runat="server" style="color:white" Text="GIVE YOUR REVIEW"></asp:Label>
        <p>
            <asp:TextBox ID="TxtName" class="form-control" placeholder="Enter Your Name" runat="server" width="500px"></asp:TextBox>
        </p>
        <p>
            <asp:TextBox ID="TxtCountry" class="form-control" placeholder="Enter Your Country" runat="server" width="500px"></asp:TextBox>
        </p>
        <p>
            <asp:TextBox ID="TxtMusicianName" class="form-control" placeholder="Enter Musician" runat="server" width="500px"></asp:TextBox>
        </p>
        <p>
            <asp:TextBox ID="TxtTrackName" class="form-control" placeholder="Enter Track" runat="server" width="500px"></asp:TextBox>
        </p>
        <p>
            <asp:TextBox ID="TxtReview" class="form-control" placeholder="Enter Review" runat="server" Width="500px"></asp:TextBox>
        </p>
        <p>
        <asp:Button ID="ReviewSubmit" class="btn aqua-gradient btn-rounded btn-sm my-0" runat="server" Text="Submit" OnClick="ReviewSubmit_Click" />
        </p>

        <asp:TextBox ID="ShowReviews" runat="server" Height="309px" Width="985px" TextMode="MultiLine"></asp:TextBox>

    </form>
    </div>
    </div>
            <!--FOOTER START-->
      <div id="footer">
        <div class="container">
          <p class="footer-block">Copyright &copy All About Music USA, Inc. All Rights Reserved.</p>
        </div>
      </div>
        <!--FOOTER END-->
</body>
</html>
