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
    public class ProductCostsController : ControllerBase
    {
        private readonly ApplicationDbContext _context;

        public ProductCostsController(ApplicationDbContext context)
        {
            _context = context;
        }

        // GET: api/ProductCosts
        [HttpGet]
        public async Task<ActionResult<IEnumerable<ProductCost>>> GetProductCost()
        {
            return await _context.ProductCost.ToListAsync();
        }

        // GET: api/ProductCosts/5
        [HttpGet("{id}")]
        public async Task<ActionResult<ProductCost>> GetProductCost(int id)
        {
            var ProductCost = await _context.ProductCost.FindAsync(id);
            
            if (ProductCost == null)
            {
                return NotFound();
            }
            return ProductCost;
        }

        // PUT: api/ProductCosts/5
        [HttpPut("{id}")]
        public async Task<IActionResult> PutProductCost(int id, ProductCost ProductCost)
        {
            if (id != ProductCost.Id)
            {
                return BadRequest();
            }

            _context.Entry(ProductCost).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ProductCostExists(id))
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

        // POST: api/ProductCosts
        [HttpPost]
        public async Task<ActionResult<ProductCost>> PostProductCost(ProductCost ProductCost)
        {
            _context.ProductCost.Add(ProductCost);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetProductCost", new { id = ProductCost.Id }, ProductCost);
        }
        // DELETE: api/ProductCosts/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<ProductCost>> DeleteProductCost(int id)
        {
            var ProductCost = await _context.ProductCost.FindAsync(id);
            if (ProductCost == null)
            {
                return NotFound();
            }
            
            _context.ProductCost.Remove(ProductCost);
            await _context.SaveChangesAsync();

            return ProductCost;
        }
        private bool ProductCostExists(int id)
        {
            return _context.ProductCost.Any(e => e.Id == id);
        }
    }
}
