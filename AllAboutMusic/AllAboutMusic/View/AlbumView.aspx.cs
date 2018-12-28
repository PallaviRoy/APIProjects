using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AllAboutMusic.Model;

namespace AllAboutMusic.View
{
    public partial class AlbumView : System.Web.UI.Page
    {
        RestClient client = new RestClient();

        static string domain = "https://musixmatchcom-musixmatch.p.mashape.com/wsr/1.1";

        static string getAlbumIdURI = "/artist.albums.get?artist_id=artistID&s_release_date=desc&g_album_name=1";
        static string getTrackIdURI = "/album.tracks.get?album_id=albumID";
        static string getLyricsURI = "/matcher.lyrics.get?q_artist=artistName&q_track=trackName";

        static string output = string.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GetAlbumsForArtist(string artistId)
        {
            client.endpoint = domain + getAlbumIdURI.Replace("artistID", artistId);
            output = client.makeRequest();
            List<Album> Albums = null;

            if (output != null)
            {
                Albums = JsonConvert.DeserializeObject<List<Album>>(output);
                albumrep.DataSource = Albums;
                albumrep.DataBind();
            }
        }

        protected void GetTracksForAlbum(string albumId) {
            
            List<Track> Tracks = null;
            client.endpoint = domain + getTrackIdURI.Replace("albumID", albumId);
            output = client.makeRequest();
            if (output != null)
            {
                Tracks = JsonConvert.DeserializeObject<List<Track>>(output);
                trackrep.DataSource = Tracks;
                trackrep.DataBind();
            }
        }

        
        protected void GetLyricsForTrack(string artistName, string songName)
        {
            client.endpoint = domain + getLyricsURI.Replace("artistName", artistName).Replace("trackName", songName);
            if (songName==null && artistName!=null)
            {
                ShowLyrics.Text = "Please enter Song or Click Search !";
                return;
            }
            else if (songName != null && artistName == null)
            {
                ShowLyrics.Text = "Please enter Artist!";
                return;
            }
            else if (songName == null && artistName == null)
            {
                ShowLyrics.Text = "Please enter Artist and Song!";
                return;
            }

            Console.WriteLine(client.endpoint);
            output = client.makeRequest();

            if (output != null)
            {
                var LyricsDis = JsonConvert.DeserializeObject<Lyrics>(output);
                ShowLyrics.Text = LyricsDis.Lyrics_body;

            }
            else
            {
                ShowLyrics.Text = "No Records Found!";
            }
        }

        protected void GetArtist_Click(object sender, EventArgs e)
        {
            ArtistView av = new ArtistView();

            List<Artist> artistList = av.GetArtistID(Artistname.Text);

            artistrep.DataSource = artistList;
            artistrep.DataBind();
        }

        protected void artistrep_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandArgument != null)
            {
                string artistId = e.CommandArgument.ToString();
                GetAlbumsForArtist(artistId);
            }
        }

        protected void albumrep_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandArgument != null)
            {
                string albumId = e.CommandArgument.ToString();
                GetTracksForAlbum(albumId);
            }
        }

        protected void trackrep_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandArgument != null)
            {
                string[] commandArgs = e.CommandArgument.ToString().Split(new char[] { ',' });
                string artist_name = commandArgs[0];
                string song_name = commandArgs[1];
                GetLyricsForTrack(artist_name, song_name);

            }
        }

        protected void GetLyrics_Click(object sender, EventArgs e)
        {
            GetLyricsForTrack(Artistname.Text, SongName.Text);
        }
    }
}