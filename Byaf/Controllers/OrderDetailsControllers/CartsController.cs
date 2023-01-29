﻿using System;
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
    public class CartsController : ControllerBase
    {
        private readonly ApplicationDbContext _context;

        public CartsController(ApplicationDbContext context)
        {
            _context = context;
        }

        // GET: api/Carts
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Cart>>> GetCart()
        {
            return await _context.Cart.ToListAsync();
        }

        // GET: api/Carts/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Cart>> GetCart(int id)
        {
            var Cart = await _context.Cart.FindAsync(id);
            
            if (Cart == null)
            {
                return NotFound();
            }
            return Cart;
        }

        // PUT: api/Carts/5
        [HttpPut("{id}")]
        public async Task<IActionResult> PutCart(int id, Cart Cart)
        {
            if (id != Cart.Id)
            {
                return BadRequest();
            }

            _context.Entry(Cart).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!CartExists(id))
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

        // POST: api/Carts
        [HttpPost]
        public async Task<ActionResult<Cart>> PostCart(Cart Cart)
        {
            _context.Cart.Add(Cart);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetCart", new { id = Cart.Id }, Cart);
        }
        // DELETE: api/Carts/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<Cart>> DeleteCart(int id)
        {
            var Cart = await _context.Cart.FindAsync(id);
            if (Cart == null)
            {
                return NotFound();
            }
            _context.Cart.Remove(Cart);
            await _context.SaveChangesAsync();

            return Cart;
        }
        private bool CartExists(int id)
        {
            return _context.Cart.Any(e => e.Id == id);
        }
    }
}
