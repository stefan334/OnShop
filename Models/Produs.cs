namespace OnShop.Models
{
    public class Produs
    {
        public int id { get; set; }
        public string name { get; set; }
        public string description { get; set; }
        public int price { get; set; }
        public string imag { get; set; }
        public string category { get; set; }
        public string size { get; set; }    
        public string stock { get; set; }
        public string[] materials { get; set; }
        public bool isImported { get; set; }
        public int sold { get; set; }
    }
}
