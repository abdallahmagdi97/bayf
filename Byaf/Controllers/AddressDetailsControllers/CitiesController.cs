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
using Byaf.Models.AddressDetails;

namespace Byaf.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class CitiesController : ControllerBase
    {
        private readonly ApplicationDbContext _context;

        public CitiesController(ApplicationDbContext context)
        {
            _context = context;
        }

        // GET: api/Citys
        [HttpGet]
        public async Task<ActionResult<IEnumerable<City>>> GetCity()
        {
            return await _context.City.ToListAsync();
        }

        // GET: api/Citys/5
        [HttpGet("{id}")]
        public async Task<ActionResult<City>> GetCity(int id)
        {
            var City = await _context.City.FindAsync(id);
            
            if (City == null)
            {
                return NotFound();
            }
            return City;
        }

        // PUT: api/Citys/5
        [HttpPut("{id}")]
        public async Task<IActionResult> PutCity(int id,City City)
        {
            if (id != City.Id)
            {
                return BadRequest();
            }

            _context.Entry(City).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!CityExists(id))
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

        // POST: api/Citys
        [HttpPost]
        public async Task<ActionResult<City>> PostCity(City City)
        {
            if (_context.City.Any(a => a.Name ==City.Name))
            {
                return StatusCode(StatusCodes.Status400BadRequest, new Response { Status = "Error", Message = "City already exists" });
            }
            _context.City.Add(City);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetCity", new { id =City.Id },City);
        }
        // DELETE: api/Citys/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<City>> DeleteCity(int id)
        {
            var City = await _context.City.FindAsync(id);
            if (City == null)
            {
                return NotFound();
            }
            _context.City.Remove(City);
            await _context.SaveChangesAsync();

            return City;
        }
        private bool CityExists(int id)
        {
            return _context.City.Any(e => e.Id == id);
        }
    }
}
