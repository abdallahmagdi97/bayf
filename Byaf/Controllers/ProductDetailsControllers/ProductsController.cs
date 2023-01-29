using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Byaf.Data;
using Byaf.Models;
using Microsoft.AspNetCore.Authorization;
using Byaf.Models.ProductDetails;
using System.IO;
using Byaf.Helpers;

namespace Byaf.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductsController : ControllerBase
    {
        private readonly ApplicationDbContext _context;

        public ProductsController(ApplicationDbContext context)
        {
            _context = context;
        }

        // GET: api/Products
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Product>>> GetProduct()
        {
            var products = await _context.Product.ToListAsync();
            foreach (var product in products)
            {
                var images = await _context.ProductImages.Where(p => p.ProductId == product.Id).ToListAsync();
                if (images.Any())
                {
                    product.Images = new List<string>();
                    product.Images.AddRange(images.Select(l => l.ImagePath).ToList());
                }
            }
            return Ok(products);
        }

        // GET: api/Products/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Product>> GetProduct(int id)
        {
            var Product = await _context.Product.FindAsync(id);
            
            if (Product == null)
            {
                return NotFound();
            }
            var images = await _context.ProductImages.Where(p => p.ProductId == Product.Id).ToListAsync();
            Product.Images.AddRange(images.Select(l => l.ImagePath).ToList());

            return Product;
        }

        // PUT: api/Products/5
        [HttpPut("{id}")]
        public async Task<IActionResult> PutProduct(int id, Product Product)
        {
            if (id != Product.Id)
            {
                return BadRequest();
            }

            _context.Entry(Product).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ProductExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // POST: api/Products
        [HttpPost]
        public async Task<ActionResult<Product>> PostProduct([FromForm]Product Product, [FromForm]List<IFormFile> files)
        {
            if (_context.Product.Any(a => a.Name == Product.Name))
            {
                return StatusCode(StatusCodes.Status400BadRequest, new Response { Status = "Error", Message = "Product already exists" });
            }

            _context.Product.Add(Product);
            await _context.SaveChangesAsync();
            var images = Helper.UploadImages(files);
            foreach(var image in images)
            {
                _context.ProductImages.Add(new ProductImages() { ImagePath = image, ProductId = Product.Id });
            }
            await _context.SaveChangesAsync();
            return CreatedAtAction("GetProduct", new { id = Product.Id }, Product);
        }
        // POST: api/Products/Upload
        [HttpPost("upload/{id}")]
        public async Task<IActionResult> OnPostUploadAsync(List<IFormFile> files, int id)
        {
            long size = files.Sum(f => f.Length);
            List<string> images = new List<string>();
            foreach (var formFile in files)
            {
                if (formFile.Length > 0)
                {
                    var filePath = Path.Combine("C:\\Users\\aedris\\AppData\\Local\\Temp", Path.GetRandomFileName());
                    images.Add(filePath);
                    using (var stream = System.IO.File.Create(filePath))
                    {
                        formFile.CopyTo(stream);
                    }
                }
            }
            foreach(var image in images)
            {
                _context.ProductImages.Add(new ProductImages() { ProductId = id, ImagePath = image });
            }
            await _context.SaveChangesAsync();

            return Ok(new { count = files.Count, size });
        }
        // DELETE: api/Products/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<Product>> DeleteProduct(int id)
        {
            var Product = await _context.Product.FindAsync(id);
            if (Product == null)
            {
                return NotFound();
            }
            
            _context.Product.Remove(Product);
            await _context.SaveChangesAsync();

            return Product;
        }
        private bool ProductExists(int id)
        {
            return _context.Product.Any(e => e.Id == id);
        }
    }
}
