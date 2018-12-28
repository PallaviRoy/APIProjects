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
    public partial class LyricsView : System.Web.UI.Page
    {
        RestClient client = new RestClient();
        string domain = "https://musixmatchcom-musixmatch.p.mashape.com/wsr/1.1";
        string getLyricsByArtistURI = "/matcher.lyrics.get?q_artist=artistName&q_track=trackName";
        string output = string.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GetLyrics_Click(object sender, EventArgs e)
        {
            client.endpoint = domain + getLyricsByArtistURI.Replace("artistName", artistName.Text).Replace("trackName", songName.Text);
            Console.WriteLine(client.endpoint);
            output = client.makeRequest();

            if (output != null)
            {
                var LyricsDis = JsonConvert.DeserializeObject<Lyrics>(output);
                LyricsShow.Text = LyricsDis.Lyrics_body;

            }
            else
            {
                LyricsShow.Text = "No Records Found!";
            }
        }
    }
}