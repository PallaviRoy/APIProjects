using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;

namespace ProduceFinalXML.View
{
    public partial class Rating : System.Web.UI.Page
    {
        static List<Review> reviews = new List<Review>();
        protected void Page_Load(object sender, EventArgs e)
        {
            addReviews();

            ShowReviews.Visible = false;
        }

        protected void ReviewSubmit_Click(object sender, EventArgs e)
        {
            reviews.Add(new Review(TxtName.Text, TxtCountry.Text, TxtMusicianName.Text, TxtTrackName.Text, TxtReview.Text));

            ShowReviews.Text = JsonConvert.SerializeObject(reviews);
            
            ShowReviews.Visible = true;

        }

        private static void addReviews()
        {
            if (reviews.Count < 1)
            {
                Review review1 = new Review("Harley", "Sweden", "Jackson", "Love of my Life", "The best song");
                Review review2 = new Review("Miley", "UK", "Jackson", "Love of my Life", "Its a beautiful song I like it very much");
                reviews.Add(review1);
                reviews.Add(review2);
            }
            
        }
    }
}