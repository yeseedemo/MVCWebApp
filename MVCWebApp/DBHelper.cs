using Npgsql;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;

namespace MVCWebApp
{
    public class DBHelper
    {
         
        /// <summary>
        /// connection string
        /// </summary>
        private static string DB_CONNECTIONSTRING
        {
            get
            {
                return ConfigurationManager.ConnectionStrings["bbpConnetion"].ConnectionString;
            }
        }
        /// <summary>
        /// 建立取得資料方式
        /// </summary>
        /// <param name="__SQLCommand"></param>
        /// <returns></returns>
        public static DataTable GetAll(string _SQLCommand)
        {
            DataTable oDataTable = new DataTable();
            using (NpgsqlConnection conn = new NpgsqlConnection(DB_CONNECTIONSTRING))
            {
                conn.Open();

                NpgsqlDataAdapter oAdapter = new NpgsqlDataAdapter(_SQLCommand, conn);
                oAdapter.Fill(oDataTable);
                if (oAdapter != null)
                    oAdapter.Dispose();
            }
            return oDataTable;
        }

        /// <summary>
        /// 建立Insert,Update,Delete 方式
        /// </summary>
        /// <param name="_SQLCommand"></param>
        /// <returns></returns>
        public static int ExecNonQuery(string _SQLCommand)
        {
            int result = 0;
            using (NpgsqlConnection connection = new NpgsqlConnection(DB_CONNECTIONSTRING))
            {
                connection.Open();

                NpgsqlCommand cmd = new NpgsqlCommand(_SQLCommand, connection);
                cmd.CommandType = CommandType.Text;

                result = cmd.ExecuteNonQuery();
                cmd.Dispose();
                connection.Close();
            }

            return result;
        }
    }
}