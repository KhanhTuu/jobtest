using BookstoreAPI.Data;
using BookstoreAPI.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore; 

namespace BookstoreAPI.Controllers
{
    [Route("api/books")]
    [ApiController]
    public class BooksController : ControllerBase
    {
        private readonly BookstoreContext _context;

        public BooksController(BookstoreContext context)
        {
            _context = context;
        }

        
        [HttpGet("fetch")]
        public async Task<ActionResult<IEnumerable<Book>>> GetBooks()
        {
            var books = await _context.Books.Include(b => b.Author).ToListAsync();
            return Ok(books);
        }

        
        [HttpGet("fetch/{id}")]
        public async Task<ActionResult<Book>> GetBook(int id)
        {
            var book = await _context.Books.Include(b => b.Author)
                                            .FirstOrDefaultAsync(b => b.BookId == id);

            if (book == null)
            {
                return NotFound();
            }

            return Ok(book);
        }

        
        [HttpPost("insert")]
        public async Task<ActionResult<Book>> PostBook([FromBody] Book book)
        {
            
            if (book.AuthorId == 0)
            {
                return BadRequest("AuthorId is required.");
            }

            
            var authorExists = await _context.Authors.AnyAsync(a => a.AuthorId == book.AuthorId);
            if (!authorExists)
            {
                return BadRequest("Author with the provided AuthorId does not exist.");
            }

            
            book.Author = null; 

           
            _context.Books.Add(book);
            await _context.SaveChangesAsync();

            
            var createdBook = await _context.Books.Include(b => b.Author)
                                                 .FirstOrDefaultAsync(b => b.BookId == book.BookId);

            
            return CreatedAtAction(nameof(GetBook), new { id = book.BookId }, createdBook);
        }



      
        [HttpPut("update")]
        public async Task<IActionResult> PutBook(int id, Book book)
        {
            if (id != book.BookId)
            {
                return BadRequest();
            }

            _context.Entry(book).State = EntityState.Modified;
            await _context.SaveChangesAsync();
            return NoContent();
        }

     
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteBook(int id)
        {
            var book = await _context.Books.FindAsync(id);
            if (book == null)
            {
                return NotFound();
            }

            _context.Books.Remove(book);
            await _context.SaveChangesAsync();
            return NoContent();
        }

       
        [HttpGet("reports/book")]
        public async Task<ActionResult<IEnumerable<Book>>> GetBooksByFilter(
            [FromQuery] string searchKey,
            [FromQuery] int? authorId,
            [FromQuery] DateTime? fromPublishedDate,
            [FromQuery] DateTime? toPublishedDate,
            [FromQuery] int? pageSize,
            [FromQuery] int? pageIndex)
        {
            var query = _context.Books.Include(b => b.Author).AsQueryable();

            if (!string.IsNullOrEmpty(searchKey))
            {
                query = query.Where(b => b.Title.Contains(searchKey));
            }

            if (authorId.HasValue)
            {
                query = query.Where(b => b.AuthorId == authorId.Value);
            }

            if (fromPublishedDate.HasValue)
            {
                query = query.Where(b => b.PublishedDate >= fromPublishedDate.Value);
            }

            if (toPublishedDate.HasValue)
            {
                query = query.Where(b => b.PublishedDate <= toPublishedDate.Value);
            }

           
            if (pageSize.HasValue && pageIndex.HasValue)
            {
                query = query.Skip((pageIndex.Value - 1) * pageSize.Value)
                             .Take(pageSize.Value);
            }

            var books = await query.ToListAsync();
            return Ok(books);
        }

    }

}
