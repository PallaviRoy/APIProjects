using System;
using System.Collections.Generic;
using AllAboutMusic.Model;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;

namespace AllAboutMusic.View
{
    public partial class ArtistView : System.Web.UI.Page
    {
        RestClient client = new RestClient();
        string domain = "https://musixmatchcom-musixmatch.p.mashape.com/wsr/1.1"; 
        string getArtistIDURI = "/artist.search?q_artist=artistName&page_size=5";
        string output = string.Empty;



        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GetArtist_Click(object sender, EventArgs e)
        {
           
            client.endpoint = domain + getArtistIDURI.Replace("artistName", Artistname.Text);
            Console.WriteLine(client.endpoint);
            output = client.makeRequest();

           if (output != null)
            {
                var Artist = JsonConvert.DeserializeObject<dynamic>(output);
                ShowArtist.Text = Artist.ToString();
              
            }
           

        }

        public List<Artist> GetArtistID(string artist_name)
        {
            //ArtistCollection ac;
            client.endpoint = domain + getArtistIDURI.Replace("artistName", artist_name);       
            output = client.makeRequest();
            List <Artist> artlistList = JsonConvert.DeserializeObject<List<Artist>>(output);
          

            return artlistList;

        }
        
    }
}