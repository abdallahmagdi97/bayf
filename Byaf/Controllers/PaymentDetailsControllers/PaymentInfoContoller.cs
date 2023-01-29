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
    public class PaymentInfoController : ControllerBase
    {
        private readonly ApplicationDbContext _context;

        public PaymentInfoController(ApplicationDbContext context)
        {
            _context = context;
        }

        // GET: api/PaymentInfo
        [HttpGet]
        public async Task<ActionResult<IEnumerable<PaymentInfo>>> GetPaymentInfo()
        {
            return await _context.PaymentInfo.ToListAsync();
        }

        // GET: api/PaymentInfo/5
        [HttpGet("{id}")]
        public async Task<ActionResult<PaymentInfo>> GetPaymentInfo(int id)
        {
            var PaymentInfo = await _context.PaymentInfo.FindAsync(id);

            if (PaymentInfo == null)
            {
                return NotFound();
            }
            return PaymentInfo;
        }

        // PUT: api/PaymentInfo/5
        [HttpPut("{id}")]
        public async Task<IActionResult> PutPaymentInfo(int id, PaymentInfo PaymentInfo)
        {
            if (id != PaymentInfo.Id)
            {
                return BadRequest();
            }

            _context.Entry(PaymentInfo).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!PaymentInfoExists(id))
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

        // POST: api/PaymentInfo
        [HttpPost]
        public async Task<ActionResult<PaymentInfo>> PostPaymentInfo(PaymentInfo PaymentInfo)
        {
            _context.PaymentInfo.Add(PaymentInfo);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetPaymentInfo", new { id = PaymentInfo.Id }, PaymentInfo);
        }
        // DELETE: api/PaymentInfo/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<PaymentInfo>> DeletePaymentInfo(int id)
        {
            var PaymentInfo = await _context.PaymentInfo.FindAsync(id);
            if (PaymentInfo == null)
            {
                return NotFound();
            }
            _context.PaymentInfo.Remove(PaymentInfo);
            await _context.SaveChangesAsync();

            return PaymentInfo;
        }
        private bool PaymentInfoExists(int id)
        {
            return _context.PaymentInfo.Any(e => e.Id == id);
        }
    }
}
