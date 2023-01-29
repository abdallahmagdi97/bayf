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
using Byaf.Models.PaymentDetails;

namespace Byaf.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class PaymentTypesController : ControllerBase
    {
        private readonly ApplicationDbContext _context;

        public PaymentTypesController(ApplicationDbContext context)
        {
            _context = context;
        }

        // GET: api/PaymentTypeTypes
        [HttpGet]
        public async Task<ActionResult<IEnumerable<PaymentType>>> GetPaymentType()
        {
            return await _context.PaymentType.ToListAsync();
        }

        // GET: api/PaymentTypeTypes/5
        [HttpGet("{id}")]
        public async Task<ActionResult<PaymentType>> GetPaymentType(int id)
        {
            var PaymentType = await _context.PaymentType.FindAsync(id);

            if (PaymentType == null)
            {
                return NotFound();
            }
            return PaymentType;
        }

        // PUT: api/PaymentTypeTypes/5
        [HttpPut("{id}")]
        public async Task<IActionResult> PutPaymentType(int id, PaymentType PaymentType)
        {
            if (id != PaymentType.Id)
            {
                return BadRequest();
            }

            _context.Entry(PaymentType).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!PaymentTypeExists(id))
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

        // POST: api/PaymentTypeTypes
        [HttpPost]
        public async Task<ActionResult<PaymentType>> PostPaymentType(PaymentType PaymentType)
        {
            _context.PaymentType.Add(PaymentType);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetPaymentType", new { id = PaymentType.Id }, PaymentType);
        }
        // DELETE: api/PaymentTypeTypes/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<PaymentType>> DeletePaymentType(int id)
        {
            var PaymentType = await _context.PaymentType.FindAsync(id);
            if (PaymentType == null)
            {
                return NotFound();
            }
            _context.PaymentType.Remove(PaymentType);
            await _context.SaveChangesAsync();

            return PaymentType;
        }
        private bool PaymentTypeExists(int id)
        {
            return _context.PaymentType.Any(e => e.Id == id);
        }
    }
}
