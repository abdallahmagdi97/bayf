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
    public class CostsController : ControllerBase
    {
        private readonly ApplicationDbContext _context;

        public CostsController(ApplicationDbContext context)
        {
            _context = context;
        }

        // GET: api/Costs
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Cost>>> GetCost()
        {
            return await _context.Cost.ToListAsync();
        }

        // GET: api/Costs/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Cost>> GetCost(int id)
        {
            var Cost = await _context.Cost.FindAsync(id);
            
            if (Cost == null)
            {
                return NotFound();
            }
            return Cost;
        }

        // PUT: api/Costs/5
        [HttpPut("{id}")]
        public async Task<IActionResult> PutCost(int id, Cost Cost)
        {
            if (id != Cost.Id)
            {
                return BadRequest();
            }

            _context.Entry(Cost).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!CostExists(id))
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

        // POST: api/Costs
        [HttpPost]
        public async Task<ActionResult<Cost>> PostCost(Cost Cost)
        {
            if (_context.Cost.Any(a => a.Name == Cost.Name))
            {
                return StatusCode(StatusCodes.Status400BadRequest, new Response { Status = "Error", Message = "Cost already exists" });
            }
            _context.Cost.Add(Cost);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetCost", new { id = Cost.Id }, Cost);
        }
        // DELETE: api/Costs/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<Cost>> DeleteCost(int id)
        {
            var Cost = await _context.Cost.FindAsync(id);
            if (Cost == null)
            {
                return NotFound();
            }
            
            _context.Cost.Remove(Cost);
            await _context.SaveChangesAsync();

            return Cost;
        }
        private bool CostExists(int id)
        {
            return _context.Cost.Any(e => e.Id == id);
        }
    }
}
