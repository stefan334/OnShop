using OnShop.Models;

namespace OnShop.Services
{
    public interface IProdusService
    {
        Task<bool> CreateProdus(Produs produs);
        Task<List<Produs>> GetProdusList();
        Task<Produs> UpdateProdus(Produs produs);
        Task<bool> DeleteProdus(int key);
        Task<Produs> GetProdus(int key);
        Task<Produs> GetProdusMostSoldPerCategory(string category);
    }
}
