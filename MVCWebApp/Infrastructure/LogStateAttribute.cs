using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Npgsql;

namespace Inventory.Infrastructure
{
    public class LogStateAttribute : ActionFilterAttribute // 繼承動作與結果過濾(通用)
    {
        public override void OnResultExecuting(ResultExecutingContext filterContext) // 之後
        {

        }

        public override void OnActionExecuting(ActionExecutingContext filterContext) // 之前
        {

        }

        private void LogState (bool state, string type, string uid)
        {
            using (NpgsqlConnection connection = new NpgsqlConnection(ConfigurationManager.AppSettings["DB"])) //連線 用web.config裡的地址
            {
                connection.Open();
                string strSQL = @"INSERT INTO public.logstate(boo_state, str_type, str_uid, tsp_time) VALUES(@state, @type, @uid, @time);"; //找尋帳號與密碼都相同的資料
                using (var cmd = new NpgsqlCommand(strSQL, connection))
                {
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
    }

    /* 功能敘述
     * login > 在action之後 (成功或失敗)
     * logout > 在action之前 (成功) 
     * 參考 https://dotblogs.com.tw/inblackbox/2013/06/07/105354
     */
}