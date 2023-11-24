using Entities;
using Repository;

namespace DAL
{
    public class AvengersDAL
    {
        public List<Avenger> getAllAvengers()
        {
            return AvengersRepo.AllAvengers;
        }
    }
}