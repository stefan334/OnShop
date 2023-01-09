using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using OnShop.Models;
using OnShop.Services;

namespace OnShop.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class UtilizatorController : Controller
    {
        private readonly IUtilizatorService _utilizatorService;

        public UtilizatorController(IUtilizatorService utilizatorService  )
        {
            _utilizatorService = utilizatorService;
        }

        [HttpGet]
        public async Task<IActionResult> Get()
        {
            var result = await _utilizatorService.GetUtilizatorList();

            return Ok(result);
        }

        [HttpGet("{id:int}")]
        public async Task<IActionResult> GetUtilizator(int id)
        {
            var result = await _utilizatorService.GetUtilizator(id);

            return Ok(result);
        }

        [HttpPost]
        public async Task<IActionResult> AddUtilizator([FromBody] Utilizator utilizator)
        {
            var result = await _utilizatorService.CreateUtilizator(utilizator);

            return Ok(result);
        }

        [HttpPut]
        public async Task<IActionResult> UpdateUtilizator([FromBody] Utilizator utilizator)
        {
            var result = await _utilizatorService.UpdateUtilizator(utilizator);

            return Ok(result);
        }

        [HttpDelete("{id:int}")]
        public async Task<IActionResult> DeleteUtilizator(int id)
        {
            var result = await _utilizatorService.DeleteUtilizator(id);

            return Ok(result);
        }
    }
}