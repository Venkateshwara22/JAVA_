using DAL;
using Entities;

namespace BL
{
    public class AvengersBL
    {
        AvengersDAL ADal = new AvengersDAL();
            public List<Avenger> getAllAvengers()
        {
            return ADal.getAllAvengers();
        }
    }
}