using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
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
        public bool Insert(string car_id, string obj_from_id, string obj_to_id, string date_from, string date_to)
        {
            if (obj_from_id == obj_to_id) return false;
            var query = $"INSERT INTO dbo.trips VALUES ({car_id},{obj_from_id},{obj_to_id},'{date_from}','{date_to}','12:00')";

            using (var connection = new SqlConnection(connectionString))
            {
                connection.Open();
                var command = new SqlCommand(query) { Connection = connection };
                command.ExecuteNonQuery();
                connection.Close();
            }
            return true;
        }

        [WebMethod]
        public DataTable GetData(string dateFrom, string dateTo)
        {
            string query = @"SELECT        dbo.trips.id, dbo.cars.name AS car, dbo.objects.name AS obj_from, objects_1.name AS obj_to, dbo.trips.date_from, dbo.trips.date_to, DATEDIFF(hh, dbo.trips.date_from, dbo.trips.date_to) AS hours
                       FROM dbo.trips INNER JOIN
                         dbo.objects ON dbo.trips.object_form_id = dbo.objects.id INNER JOIN
                         dbo.objects AS objects_1 ON dbo.trips.object_to_id = objects_1.id INNER JOIN
                         dbo.cars ON dbo.trips.car_id = dbo.cars.id ";
            if (!string.IsNullOrEmpty(dateFrom) && !string.IsNullOrEmpty(dateTo))
            {
                query += $"WHERE dbo.trips.date_from >= '{dateFrom}' AND dbo.trips.date_from <= '{dateTo}'";
            }
            using (var connection = new SqlConnection(connectionString))
            {
                var dataAdapter = new SqlDataAdapter()
                {
                    SelectCommand = new SqlCommand(query)
                    {
                        Connection = connection
                    }
                };
                var table = new DataTable() { TableName = "Trips" };
                dataAdapter.Fill(table);

                return table;
            }
        }

        [WebMethod]
        public void Delete(string id)
        {
            var query = $"DELETE FROM dbo.trips WHERE id={id};";
            using (var connection = new SqlConnection(connectionString))
            {
                connection.Open();
                var command = new SqlCommand(query) { Connection = connection };
                command.ExecuteNonQuery();
                connection.Close();
            }
        }

        [WebMethod]
        public DataTable GetSelectData(string tableName)
        {
            string query = $"SELECT * FROM dbo.{tableName}";
            using (var connection = new SqlConnection(connectionString))
            {
                var dataAdapter = new SqlDataAdapter()
                {
                    SelectCommand = new SqlCommand(query)
                    {
                        Connection = connection
                    }
                };
                var table = new DataTable() { TableName = tableName };
                dataAdapter.Fill(table);
                return table;
            }
        }
    }
}
