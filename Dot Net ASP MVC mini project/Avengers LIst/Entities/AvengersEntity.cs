namespace Entities
{
    public class Avenger
    {
        public int Id { get; set; }
        public string? Name {  get; set; }
        public string? Location { get; set; }
        public int? Age { get; set; }    
        public string? Power { get ; set; }
        public DateTime ? Created { get; set; }=DateTime.Now;
        public DateTime? Updated { get; set; }=DateTime.Now;

        public Avenger() { }

        public Avenger(int id, string? name, string? location, int? age, string? power, DateTime? created, DateTime? updated)
        {
            Id = id;
            Name = name;
            Location = location;
            Age = age;
            Power = power;
            Created = created;
            Updated = updated;
        }
    }
}