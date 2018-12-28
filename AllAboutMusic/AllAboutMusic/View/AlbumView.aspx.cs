using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AllAboutMusic.Model;
using System.Drawing;

namespace AllAboutMusic.View
{
    public partial class AlbumView : System.Web.UI.Page
    {
        private RestClient client = new RestClient();

        static string domain = "https://musixmatchcom-musixmatch.p.mashape.com/wsr/1.1";

        static string getArtistIDURI = "/artist.search?q_artist=artistName&page_size=5";
        static string getAlbumIdURI = "/artist.albums.get?artist_id=artistID&s_release_date=desc&g_album_name=1";
        static string getTrackIdURI = "/album.tracks.get?album_id=albumID";
        static string getLyricsURI = "/matcher.lyrics.get?q_artist=artistName&q_track=trackName";


        protected void Page_Load(object sender, EventArgs e)
        {
            ShowLyrics.Visible = false;
        }

        public void GetArtistID(string artist_name)
        {
            string output = string.Empty;
            List<Artist> artlistList = null;
            ShowLyrics.Visible = false;
            clearRepeater(artistrep);

            client.endpoint = domain + getArtistIDURI.Replace("artistName", Artistname.Text);

            try
            {
                output = client.makeRequest();

                if (!string.IsNullOrEmpty(output))
                {
                    artlistList = JsonConvert.DeserializeObject<List<Artist>>(output);

                    if (artlistList.Count > 0)
                    {
                        artistrep.DataSource = artlistList;
                        artistrep.DataBind();
                    }
                    
                    clearRepeater(albumrep);
                    clearRepeater(trackrep);


                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.ToString());
                ShowLyrics.Visible = true;
                ShowLyrics.Text = "Error Ocurred!"+ ex.Message;
                ShowLyrics.ForeColor = Color.Red;
                ShowLyrics.Font.Bold = true;
            }
        }

        protected void GetAlbumsForArtist(string artistId)
        {
            string output = string.Empty;
            clearRepeater(albumrep);
            ShowLyrics.Visible = false;

            client.endpoint = domain + getAlbumIdURI.Replace("artistID", artistId);

            try
            {
                output = client.makeRequest();
                List<Album> Albums = null;

                if (!string.IsNullOrEmpty(output))
                {
                    Albums = JsonConvert.DeserializeObject<List<Album>>(output);
                    if (Albums.Count > 0)
                    {
                        albumrep.DataSource = Albums;
                        albumrep.DataBind();
                    }

                    clearRepeater(trackrep);
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.ToString());
                ShowLyrics.Visible = true;
                ShowLyrics.Text = "Error Ocurred!"+ex.Message;
                ShowLyrics.ForeColor = Color.Red;
                ShowLyrics.Font.Bold = true;
            }
        }

        protected void GetTracksForAlbum(string albumId)
        {

            string output = string.Empty;
            clearRepeater(trackrep);
            ShowLyrics.Visible = false;

            List<Track> Tracks = null;
            client.endpoint = domain + getTrackIdURI.Replace("albumID", albumId);

            try
            {
                output = client.makeRequest();
                if (!string.IsNullOrEmpty(output))
                {
                    Tracks = JsonConvert.DeserializeObject<List<Track>>(output);

                    if (Tracks.Count > 0)
                    {
                        trackrep.DataSource = Tracks;
                        trackrep.DataBind();
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.ToString());
                ShowLyrics.Visible = true;
                ShowLyrics.Text = "Error Ocurred!" + ex.Message;
                ShowLyrics.ForeColor = Color.Red;
                ShowLyrics.Font.Bold = true;

            }
        }


        protected void GetLyricsForTrack(string artistName, string songName)
        {
            string output = string.Empty;
            ShowLyrics.Visible = true;

            if (!string.IsNullOrEmpty(output))
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

            client.endpoint = domain + getLyricsURI.Replace("artistName", artistName).Replace("trackName", songName);

            try
            {
                output = client.makeRequest();

                if (!string.IsNullOrEmpty(output))
                {
                    var LyricsDis = JsonConvert.DeserializeObject<Lyric>(output);

                    string song_artist = songName + " by " + artistName + "\n\n";
                    ShowLyrics.Text = song_artist + LyricsDis.Lyrics_body;

                }
                else
                {
                    ShowLyrics.Text = "No Records Found!";
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.ToString());
                ShowLyrics.Text = "Error Ocurred!";
                ShowLyrics.ForeColor = Color.Red;
                ShowLyrics.Font.Bold = true;
            }
        }

        protected void GetArtist_Click(object sender, EventArgs e)
        {
            GetArtistID(Artistname.Text);
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

        protected void clearRepeater(Repeater rep)
        {
            rep.DataSource = null;
            rep.DataSourceID = null;
            rep.DataBind();
        }

        protected void ArtistReset_Click(object sender, EventArgs e)
        {
            Artistname.Text = "";
            clearRepeater(artistrep);
            clearRepeater(albumrep);
            clearRepeater(trackrep);
        }

        protected void SongReset_Click(object sender, EventArgs e)
        {
            SongName.Text = "";
        }
    }
}