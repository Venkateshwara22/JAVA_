using Entities;

namespace Repository
{
    //making this class as static because it is just a collection of our data
    public static class AvengersRepo
    {
        public static List<Avenger> AllAvengers = new List<Avenger>()
        {
            new Avenger { Id = 1, Name="Captain America", Location="Brooklyn", Age=93, Power="Super-Human" },
             new Avenger { Id = 2, Name="IronMan", Location="Malibu", Age=53, Power="Iron-Armour" },
             new Avenger { Id = 3,Name="Thor", Location="Asgard", Age=1059, Power="God Of Thunder"},
             new Avenger { Id = 4,Name="Hulk",Location="Rocinha ", Age=54,Power="Super-Human Strength & size"}
             

        };

    }
}