using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AllAboutMusic.Model
{
    /// <summary>Class <c>Lyric</c> models a lyric with it's most useful 
    /// attributes.</summary>
    ///
    public class Lyric
    {
        private string lyrics_id;
        private string lyrics_body;
        private string lyrics_language;
        private string updated_time;

        public string Lyrics_id { get => lyrics_id; set => lyrics_id = value; }
        public string Lyrics_body { get => lyrics_body; set => lyrics_body = value; }
        public string Lyrics_language { get => lyrics_language; set => lyrics_language = value; }
        public string Updated_time { get => updated_time; set => updated_time = value; }
    }
}