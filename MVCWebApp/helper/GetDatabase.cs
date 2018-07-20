using Npgsql;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;

namespace MVCWebApp.helper
{
    public static class GetDatabase
    {
        // 統一實作DataTable抓DB資料
        public static DataTable GetDT (string strSQL, Dictionary<string, Type> dicModel)
        {
            DataTable dt;
            dt = new DataTable();
            // 查字典去創造dt的Columns
            foreach (KeyValuePair<string, Type> item in dicModel)
            {
                dt.Columns.Add(item.Key, item.Value);
            }
            // 連結資料庫
            using (NpgsqlConnection connection = new NpgsqlConnection(ConfigurationManager.AppSettings["DB"])) //連線 用web.config裡的地址
            {
                connection.Open();
                using (NpgsqlCommand cmd = new NpgsqlCommand(strSQL, connection))
                {
                    NpgsqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        DataRow row = dt.NewRow();
                        foreach (KeyValuePair<string, Type> item in dicModel)
                        {
                            row[item.Key] = reader[item.Key];
                        }
                        dt.Rows.Add(row);
                    }
                    cmd.Dispose();
                    connection.Close();
                    return dt;
                }
            }
        }
    }
}