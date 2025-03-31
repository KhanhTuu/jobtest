using System.Text.Json.Serialization;

namespace BookstoreAPI.Models
{
    public class Book
    {
        public int BookId { get; set; }
        public string Title { get; set; }
        public decimal Price { get; set; }
        public int AuthorId { get; set; }
        [JsonIgnore]
        public Author? Author { get; set; }
        public DateTime? PublishedDate { get; set; }
    }

}
