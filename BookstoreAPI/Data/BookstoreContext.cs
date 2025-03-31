using Microsoft.EntityFrameworkCore;
using BookstoreAPI.Models; 
using Microsoft.EntityFrameworkCore;

namespace BookstoreAPI.Data
{
    public class BookstoreContext : DbContext
    {
        public DbSet<Author> Authors { get; set; }
        public DbSet<Book> Books { get; set; }

        public BookstoreContext(DbContextOptions<BookstoreContext> options) : base(options) { }
    }
}
