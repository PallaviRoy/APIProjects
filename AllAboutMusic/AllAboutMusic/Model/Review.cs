using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProduceFinalXML
{
    public class Review
    {
        public String Name;
        public String Country;
        public String Musician;
        public String Track;
        public String ReviewDescription;


        public Review(String Name, String Country, String Musician, String Track, String ReviewDescription)
        {
            this.Name = Name;
            this.Country = Country;
            this.Musician = Musician;
            this.Track = Track;
            this.ReviewDescription = ReviewDescription;
        }
    }
}