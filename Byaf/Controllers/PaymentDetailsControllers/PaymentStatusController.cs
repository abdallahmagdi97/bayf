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
    public class PaymentStatusController : ControllerBase
    {
        private readonly ApplicationDbContext _context;

        public PaymentStatusController(ApplicationDbContext context)
        {
            _context = context;
        }

        // GET: api/PaymentStatusStatus
        [HttpGet]
        public async Task<ActionResult<IEnumerable<PaymentStatus>>> GetPaymentStatus()
        {
            return await _context.PaymentStatus.ToListAsync();
        }

        // GET: api/PaymentStatusStatus/5
        [HttpGet("{id}")]
        public async Task<ActionResult<PaymentStatus>> GetPaymentStatus(int id)
        {
            var PaymentStatus = await _context.PaymentStatus.FindAsync(id);

            if (PaymentStatus == null)
            {
                return NotFound();
            }
            return PaymentStatus;
        }

        // PUT: api/PaymentStatusStatus/5
        [HttpPut("{id}")]
        public async Task<IActionResult> PutPaymentStatus(int id, PaymentStatus PaymentStatus)
        {
            if (id != PaymentStatus.Id)
            {
                return BadRequest();
            }

            _context.Entry(PaymentStatus).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!PaymentStatusExists(id))
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

        // POST: api/PaymentStatusStatus
        [HttpPost]
        public async Task<ActionResult<PaymentStatus>> PostPaymentStatus(PaymentStatus PaymentStatus)
        {
            _context.PaymentStatus.Add(PaymentStatus);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetPaymentStatus", new { id = PaymentStatus.Id }, PaymentStatus);
        }
        // DELETE: api/PaymentStatusStatus/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<PaymentStatus>> DeletePaymentStatus(int id)
        {
            var PaymentStatus = await _context.PaymentStatus.FindAsync(id);
            if (PaymentStatus == null)
            {
                return NotFound();
            }
            _context.PaymentStatus.Remove(PaymentStatus);
            await _context.SaveChangesAsync();

            return PaymentStatus;
        }
        private bool PaymentStatusExists(int id)
        {
            return _context.PaymentStatus.Any(e => e.Id == id);
        }
    }
}
