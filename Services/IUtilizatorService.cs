using OnShop.Models;

namespace OnShop.Services
{
    public interface IUtilizatorService
    {
        Task<bool> CreateUtilizator(Utilizator utilizator);
        Task<List<Utilizator>> GetUtilizatorList();
        Task<Utilizator> UpdateUtilizator(Utilizator utilizator);
        Task<bool> DeleteUtilizator(int key);
        Task<Utilizator> GetUtilizator(int key);
        Task<Utilizator> GetUtilizatorByEmail(string email);
    }
}
