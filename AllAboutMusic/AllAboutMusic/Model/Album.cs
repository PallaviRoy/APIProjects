using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AllAboutMusic.Model
{
    /// <summary>Class <c>Album</c> models an album with it's most useful 
    /// attributes.</summary>
    ///
    public class Album
    {
        private string album_id;
        private string album_name;
        private string album_rating;
        private string album_track_count;
        private string album_edit_url;

        public string Album_id { get => album_id; set => album_id = value; }
        public string Album_name { get => album_name; set => album_name = value; }
        public string Album_rating { get => album_rating; set => album_rating = value; }
        public string Album_track_count { get => album_track_count; set => album_track_count = value; }
        public string Album_edit_url { get => album_edit_url; set => album_edit_url = value; }
    }
}