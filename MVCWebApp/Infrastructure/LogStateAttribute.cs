using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Npgsql;

namespace Inventory.Infrastructure
{
    public class LogStateAttribute : AuthorizeAttribute //繼承授權屬性
    {

    }
    /*
    static void LogState(bool state, string type, string uid)
    {
        using (NpgsqlConnection connection = new NpgsqlConnection(ConfigurationManager.AppSettings["DB"])) //連線 用web.config裡的地址
        {
            connection.Open();
            string strSQL = @"INSERT INTO public.logstate(boo_state, str_type, str_uid, tsp_time) VALUES(@state, @type, @uid, @time);"; //找尋帳號與密碼都相同的資料
            using (var cmd = new NpgsqlCommand(strSQL, connection))
            {
                // 預防SQL Injection
                cmd.Parameters.AddWithValue("@state", state);
                cmd.Parameters.AddWithValue("@type", type);
                cmd.Parameters.AddWithValue("@uid", uid);
                cmd.Parameters.AddWithValue("@time", Convert.ToDateTime(System.DateTime.Now.ToString("F"))); //格式化成F 再轉回DateTime 以避免小於秒的值被記錄

                cmd.ExecuteNonQuery();
                cmd.Dispose();
                connection.Close();
            }
        }
    }
    */
}