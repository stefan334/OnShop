using Microsoft.AspNetCore.Mvc;
using OnShop.Models;
using OnShop.Services;

namespace OnShop.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class ProdusController : Controller
    {
        private readonly IProdusService _produsService;

        public ProdusController(IProdusService produsService)
        {
            _produsService = produsService;
        }

        [HttpGet]
        public async Task<IActionResult> Get()
        {
            var result = await _produsService.GetProdusList();

            return Ok(result);
        }

        [HttpGet("{id:int}")]
        public async Task<IActionResult> GetProdus(int id)
        {
            var result = await _produsService.GetProdus(id);

            return Ok(result);
        }

        [HttpPost]
        public async Task<IActionResult> AddProdus([FromBody] Produs produs)
        {

            //TODO: Add product only if user is moderator. How to check what user is currently logged in? With the cookie maybe. We have to add something to the cookie then (username).
            var ctx = HttpContext;
            var test = ctx.Request.Headers.FirstOrDefault(x => x.Key == "email").Value;
            var result = await _produsService.CreateProdus(produs);

            return Ok(result);
        }

        [HttpPut]
        public async Task<IActionResult> UpdateProdus([FromBody] Produs produs)
        {
            var result = await _produsService.UpdateProdus(produs);

            return Ok(result);
        }

        [HttpDelete("{id:int}")]
        public async Task<IActionResult> DeleteProdus(int id)
        {
            var result = await _produsService.DeleteProdus(id);

            return Ok(result);
        }

        [HttpGet("produs/mostSold/{category}")]
        public async Task<IActionResult> GetProdusMostSoldPerCategory(string category)
        {
            var result = await _produsService.GetProdusMostSoldPerCategory(category);
            return Ok(result);
        }

    }
}
