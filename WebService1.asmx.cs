using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace Lab_3
{
    /// <summary>
    /// Summary description for WebService1
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class WebService1 : System.Web.Services.WebService
    {
        
        private string connectionString { get; } = "workstation id=autoTrips.mssql.somee.com;packet size=4096;user id=Gena20_SQLLogin_1;pwd=hlzsx7f1ej;data source=autoTrips.mssql.somee.com;persist security info=False;initial catalog=autoTrips";

        [WebMethod]
        public bool Insert(string car_id, string obj_from_id, string obj_to_id, DateTime date_from, DateTime date_to)
        {
            if (obj_from_id == obj_to_id) return false;
            using (autoTripsEntities db = new autoTripsEntities())
            {
                db.trips.Add(new trip
                {
                    car_id = int.Parse(car_id),
                    object_form_id = int.Parse(obj_from_id),
                    object_to_id = int.Parse(obj_to_id),
                    date_from = date_from,
                    date_to = date_to,
                });

                db.SaveChanges();
                return true;
            }
        }

        [WebMethod]
        public DataTable GetData(DateTime? dateFrom, DateTime? dateTo)
        {
            using (autoTripsEntities db = new autoTripsEntities())
            {
                var trips = new List<trip>();
                if (dateFrom != null && dateTo != null)
                {
                    trips = db.trips
                        .Where(trip => dateFrom <= trip.date_from && trip.date_from <= dateTo).ToList();
                }
                else
                {
                    trips = db.trips.ToList();
                }

                var table = new DataTable("Trips");
                var cols = new[] { "id", "car", "obj_from", "obj_to", "date_from", "date_to", "hours" };

                cols.ForEach(col => table.Columns.Add(col));
                trips.ForEach(trip => table.Rows.Add(trip.id, trip.car.name, trip.@object.name, trip.object1.name, trip.date_from, trip.date_to, (trip.date_to - trip.date_from).ToString()));

                return table;
            }
        }

        [WebMethod]
        public void Delete(int id)
        {
            using (autoTripsEntities db = new autoTripsEntities())
            {
                var trip = db.trips.FirstOrDefault(t => t.id == id);
                if (trip != null)
                {
                    db.trips.Remove(trip);
                    db.SaveChanges();
                }
            }
        }

        [WebMethod]
        public DataTable GetSelectData(string tableName)
        {
            using (autoTripsEntities db = new autoTripsEntities())
            {
                var table = new DataTable(tableName);
                var cols = new[] { "id", "name" };
                cols.ForEach(col => table.Columns.Add(col));

                if (tableName == "cars")
                {
                    var cars = db.cars.ToList();
                    cars.ForEach(car => table.Rows.Add(car.id, car.name));

                }
                else if (tableName == "objects")
                {
                    var objects = db.objects.ToList();
                    objects.ForEach(@object => table.Rows.Add(@object.id, @object.name));
                }

                return table;
            }
        }
    }
}
