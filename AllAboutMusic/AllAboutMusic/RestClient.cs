using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Net;

namespace AllAboutMusic
{
    public enum HttpVerb
    {
        GET,
        POST,
        PUT,
        DELETE
    }

    public class RestClient
    {
        public string endpoint { get; set; }
        public HttpVerb httpmethod { get; set; }

        public RestClient()
        {
            endpoint = string.Empty;
            httpmethod = HttpVerb.GET;
        }

        public string makeRequest()
        {
            string ResponseString = string.Empty;

            HttpWebRequest request = (HttpWebRequest)WebRequest.Create(endpoint);
            request.Method = httpmethod.ToString();
            request.Headers.Add("X-Mashape-Key", "k8GT1ZOGevmsh2InhnwSqB0BlDVtp1OJpsrjsnON2zXrgcteyu");
            request.Accept = "application/json";

            try
            {
                using (HttpWebResponse response = (HttpWebResponse)request.GetResponse())
                {
                    if (response.StatusCode != HttpStatusCode.OK)
                    {
                        return (response.StatusCode + "error occurred here!");
                    }

                    using (Stream responseStream = response.GetResponseStream())
                    {
                        if (responseStream != null)
                        {
                            using (StreamReader reader = new StreamReader(responseStream))
                            {
                                ResponseString = reader.ReadToEnd();
                            }
                        }
                    }
                }
            } catch (Exception ex) {
                System.Diagnostics.Debug.WriteLine(ex.ToString());
            }
            return ResponseString;
        }

    }
}