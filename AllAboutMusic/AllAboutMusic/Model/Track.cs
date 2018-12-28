using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AllAboutMusic.Model
{
    /// <summary>Class <c>Track</c> models a track with it's most useful 
    /// attributes.</summary>
    ///
    public class Track
    {
        private string track_id;
        private string track_name;
        private string track_rating;
        private string album_name;
        private string artist_name;
        private string lyrics_id;
         
        
         public string Track_id { get => track_id; set => track_id = value; }
        public string Track_name { get => track_name; set => track_name = value; }
        public string Track_rating { get => track_rating; set => track_rating = value; }
        public string Album_name { get => album_name; set => album_name = value; }
        public string Artist_name { get => artist_name; set => artist_name = value; }
        public string Lyrics_id { get => lyrics_id; set => lyrics_id = value; }
    }
}