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

namespace Byaf.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class ProductCategoriesController : ControllerBase
    {
        private readonly ApplicationDbContext _context;

        public ProductCategoriesController(ApplicationDbContext context)
        {
            _context = context;
        }

        // GET: api/ProductCategories
        [HttpGet]
        public async Task<ActionResult<IEnumerable<ProductCategory>>> GetProductCategory()
        {
            return await _context.ProductCategory.ToListAsync();
        }

        // GET: api/ProductCategories/5
        [HttpGet("{id}")]
        public async Task<ActionResult<ProductCategory>> GetProductCategory(int id)
        {
            var ProductCategory = await _context.ProductCategory.FindAsync(id);
            
            if (ProductCategory == null)
            {
                return NotFound();
            }
            return ProductCategory;
        }

        // PUT: api/ProductCategories/5
        [HttpPut("{id}")]
        public async Task<IActionResult> PutProductCategory(int id, ProductCategory ProductCategory)
        {
            if (id != ProductCategory.Id)
            {
                return BadRequest();
            }

            _context.Entry(ProductCategory).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ProductCategoryExists(id))
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

        // POST: api/ProductCategories
        [HttpPost]
        public async Task<ActionResult<ProductCategory>> PostProductCategory(ProductCategory ProductCategory)
        {
            _context.ProductCategory.Add(ProductCategory);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetProductCategory", new { id = ProductCategory.Id }, ProductCategory);
        }
        // DELETE: api/ProductCategories/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<ProductCategory>> DeleteProductCategory(int id)
        {
            var ProductCategory = await _context.ProductCategory.FindAsync(id);
            if (ProductCategory == null)
            {
                return NotFound();
            }
            
            _context.ProductCategory.Remove(ProductCategory);
            await _context.SaveChangesAsync();

            return ProductCategory;
        }
        private bool ProductCategoryExists(int id)
        {
            return _context.ProductCategory.Any(e => e.Id == id);
        }
    }
}
