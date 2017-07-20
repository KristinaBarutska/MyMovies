using Newtonsoft.Json;
using System;

namespace MovieScrapper.Models
{
    [JsonObject]
    [Serializable]
    public class Movie
    {
        public string Id { get; set; }
        public string Title { get; set; }

        [JsonProperty("release_date")]
        public string ReleaseDate { get; set; }

        [JsonProperty("poster_path")]
        public string PosterPath { get; set; }
        public string Overview { get; set; }

    }
}