using OnShop.Models;

namespace OnShop.Services
{
    public class UtilizatorService : IUtilizatorService
    {
        private readonly IDbService _dbService;

        public UtilizatorService(IDbService dbService)
        {
            _dbService = dbService;
        }

        public async Task<bool> CreateUtilizator(Utilizator utilizator)
        {
            var result =
                await _dbService.EditData(
                    "INSERT INTO public.Utilizator (username, nume, prenume, parola, rol, email) VALUES (@username, @nume, @prenume, @parola, CAST(@rol as roluri), @email)",
                    utilizator);
            return true;
        }

        public async Task<List<Utilizator>> GetUtilizatorList()
        {
            var utilizatorList = await _dbService.GetAll<Utilizator>("SELECT * FROM public.Utilizator", new { });
            return utilizatorList;
        }


        public async Task<Utilizator> GetUtilizator(int id)
        {
            var utilizatorList = await _dbService.GetAsync<Utilizator>("SELECT * FROM public.Utilizator where id=@id", new { id });
            return utilizatorList;
        }

        public async Task<Utilizator> UpdateUtilizator(Utilizator utilizator)
        {
            var updateUtilizator =
                await _dbService.EditData(
                    "Update public.Utilizator SET username=@username, nume=@nume, prenume=@prenume, parola=@parola, rol=CAST(@rol) as roluri, email=@email WHERE id=@id",
                    utilizator);
            return utilizator;
        }

        public async Task<bool> DeleteUtilizator(int id)
        {
            var deleteUtilizator = await _dbService.EditData("DELETE FROM public.Utilizator WHERE id=@Id", new { id });
            return true;
        }

        public async Task<Utilizator> GetUtilizatorByEmail(string email)
        {
            var utilizator =  (await _dbService.GetAll<Utilizator>("SELECT * FROM PUBLIC.Utilizator where email = @email", new { email })).First() ;
            return utilizator;  
        }
    }
}
