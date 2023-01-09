using OnShop.Models;

namespace OnShop.Services
{
    public class ProdusService : IProdusService
    {
        private readonly IDbService _dbService;

        public ProdusService(IDbService dbService)
        {
            _dbService = dbService;
        }

        public async Task<bool> CreateProdus(Produs produs)
        {
            var result =
                await _dbService.EditData(
                    "INSERT INTO public.Produs (id, name, description, price, imag, category, size, stock, added_on, color, materials, is_imported) VALUES (@id, @name, @description, @price, @imag, @category, @size, @stock, @added_on, @color, @materials, @is_imported)",
                    produs);
            return true;
        }

        public async Task<bool> DeleteProdus(int id)
        {
            var deleteProdus = await _dbService.EditData("DELETE FROM public.Produs WHERE id=@Id", new { id });
            return true;
        }

        public async Task<Produs> GetProdus(int id)
        {
            var produs = await _dbService.GetAsync<Produs>("SELECT * FROM public.Produs where id=@id", new { id });
            return produs;
        }

        public async Task<List<Produs>> GetProdusList()
        {
            var produsList = await _dbService.GetAll<Produs>("SELECT * FROM public.Produs", new { });
            return produsList;
        }

        public async Task<Produs> UpdateProdus(Produs produs)
        {
            var updateProdus =
               await _dbService.EditData(
                   "Update public.produs SET name=@name, description=@description, price=@price, imag=@imag, category=@category, size=@size, stock=@stock, added_on=@added_on, color=@color, materials=@materials, is_imported=@is_imported WHERE id=@id",
                   produs);
            return produs;
        }

        public async Task<Produs> GetProdusMostSoldPerCategory(string category)
        {
            var produs = await _dbService.GetAsync<Produs>("SELECT * FROM public.Produs where category=@category order by sold DESC LIMIT 1 ", new { category });
            return produs;
        }
    }
}
