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
using Byaf.Models.OrderDetails;

namespace Byaf.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class OrderStatusController : ControllerBase
    {
        private readonly ApplicationDbContext _context;

        public OrderStatusController(ApplicationDbContext context)
        {
            _context = context;
        }

        // GET: api/OrderStatus
        [HttpGet]
        public async Task<ActionResult<IEnumerable<OrderStatus>>> GetOrderDetail()
        {
            return await _context.OrderStatus.ToListAsync();
        }

        // GET: api/OrderStatus/5
        [HttpGet("{id}")]
        public async Task<ActionResult<OrderStatus>> GetOrderDetail(int id)
        {
            var OrderDetail = await _context.OrderStatus.FindAsync(id);
            
            if (OrderDetail == null)
            {
                return NotFound();
            }
            return OrderDetail;
        }

        // PUT: api/OrderStatus/5
        [HttpPut("{id}")]
        public async Task<IActionResult> PutOrderDetail(int id, OrderStatus OrderDetail)
        {
            if (id != OrderDetail.Id)
            {
                return BadRequest();
            }

            _context.Entry(OrderDetail).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!OrderDetailExists(id))
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

        // POST: api/OrderStatus
        [HttpPost]
        public async Task<ActionResult<OrderStatus>> PostOrderDetail(OrderStatus OrderDetail)
        {
            _context.OrderStatus.Add(OrderDetail);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetOrderDetail", new { id = OrderDetail.Id }, OrderDetail);
        }
        // DELETE: api/OrderStatus/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<OrderStatus>> DeleteOrderDetail(int id)
        {
            var OrderDetail = await _context.OrderStatus.FindAsync(id);
            if (OrderDetail == null)
            {
                return NotFound();
            }
            _context.OrderStatus.Remove(OrderDetail);
            await _context.SaveChangesAsync();

            return OrderDetail;
        }
        private bool OrderDetailExists(int id)
        {
            return _context.OrderStatus.Any(e => e.Id == id);
        }
    }
}
