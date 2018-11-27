using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AllAboutMusic.Model
{
    public class Artist
    {
        private int artist_id;
        private string artist_mbid;
        private string artist_name;
        private List<object> artist_name_translation;
        private string artist_comment;
        private string artist_country;
        private List<object> artist_alias;
        private int artist_rating;
        private PrimaryGenres primary_genres;
        private SecondaryGenres secondary_genres;
        private string artist_twitter_url;
        private string artist_vanity_id;
        private string artist_edit_url;
        private string artist_share_url;
        private ArtistCredits artist_credits;
        private bool restricted;
        private int managed;
        private string updated_time;

        public int Artist_id { get => artist_id; set => artist_id = value; }
        public string Artist_mbid { get => artist_mbid; set => artist_mbid = value; }
        public string Artist_name { get => artist_name; set => artist_name = value; }
        public List<object> Artist_name_translation { get => artist_name_translation; set => artist_name_translation = value; }
        public string Artist_comment { get => artist_comment; set => artist_comment = value; }
        public string Artist_country { get => artist_country; set => artist_country = value; }
        public List<object> Artist_alias { get => artist_alias; set => artist_alias = value; }
        public int Artist_rating { get => artist_rating; set => artist_rating = value; }
        public PrimaryGenres Primary_genres { get => primary_genres; set => primary_genres = value; }
        public SecondaryGenres Secondary_genres { get => secondary_genres; set => secondary_genres = value; }
        public string Artist_twitter_url { get => artist_twitter_url; set => artist_twitter_url = value; }
        public string Artist_vanity_id { get => artist_vanity_id; set => artist_vanity_id = value; }
        public string Artist_edit_url { get => artist_edit_url; set => artist_edit_url = value; }
        public string Artist_share_url { get => artist_share_url; set => artist_share_url = value; }
        public ArtistCredits Artist_credits { get => artist_credits; set => artist_credits = value; }
        public bool Restricted { get => restricted; set => restricted = value; }
        public int Managed { get => managed; set => managed = value; }
        public string Updated_time { get => updated_time; set => updated_time = value; }
    }

    public class PrimaryGenres
    {
        public List<object> music_genre { get; set; }
    }

    public class SecondaryGenres
    {
        public List<object> music_genre { get; set; }
    }

    public class ArtistCredits
    {
        public List<object> artist { get; set; }
    }
}