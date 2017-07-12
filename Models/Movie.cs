﻿using Newtonsoft.Json;

namespace MovieScrapper.Models
{
    public class Movie
    {
        public string Title { get; set; }
        [JsonProperty("release_date")]
        public string ReleaseDate { get; set; }

    }
}