using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Security.Claims;
using System.Web;
using System.Web.Mvc;
using MVCWebApp.Models;
using Npgsql;
using MVCWebApp.helper;

namespace Inventory.Infrastructure
{
    // 參考 http://www.neekgreen.com/2017/10/09/real-world-asp-net-mvc-action-filters/
    /*
    public class CurrentUserRequiredActionFilter : IActionFilter
    {
        public void OnActionExecuted(ActionExecutedContext filterContext) { }
        public void OnActionExecuting(ActionExecutingContext filterContext)
        {
            // (1)
        var items =
            filterContext.ActionParameters.Values
                .OfType<IUserAuthData>()
                .ToArray();
            
            if (items.Any())
            {
                /* (2)
                var identity =
                filterContext.HttpContext.User.Identity as ClaimsIdentity;

                var userId = identity.GetUserId();

                // (3)
                foreach (var item in items)
                {
                    item.CurrentUserId = userId;
                }
                
            }
        }
    }
    */

    public class LogStateAttribute : ActionFilterAttribute , IActionFilter // 繼承動作與結果過濾(通用)
    {
        private string NowPath;

        // Action 之前
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            NowPath = filterContext.RouteData.Values["action"].ToString(); //先抓取來源Action
            if (NowPath == "Logout")
            {
                LogState(true, NowPath, Convert.ToString(filterContext.HttpContext.Session["uid"]));
            }
        }
        // Action 之後
        public override void OnActionExecuted(ActionExecutedContext filterContext)
        {
            /*
            var items = filterContext.ActionParameters.Values.OfType<IUserAuthData>().ToArray();
            要用介面去model抓uid和upw

            if (items.Any())
            {
            }
            */

                if (NowPath == "Login")
            {
                string uid = Convert.ToString(filterContext.HttpContext.Session["uid"]);
                string upw = Convert.ToString(filterContext.HttpContext.Session["upw"]);
                string ugroup = CheckLoginData(uid, upw);
                bool Islogin = true;

                switch (ugroup)
                {
                    case "USER":
                        filterContext.HttpContext.Session["upw"] = ""; //清空密碼
                        filterContext.HttpContext.Session["key"] = ugroup; // 加入群組
                        filterContext.Result = new RedirectResult("/User/DB_User");
                        break;
                    case "ADMIN":
                        filterContext.HttpContext.Session["upw"] = ""; //清空密碼
                        filterContext.HttpContext.Session["key"] = ugroup; // 加入群組
                        filterContext.Result = new RedirectResult("/Admin/DB_Admin");
                        break;
                    default:
                        filterContext.Controller.ViewBag.Msg = "帳號或密碼錯誤，請重新輸入";
                        Islogin = false;
                        break;
                }
                LogState(Islogin, "Login", uid);
            }
        }

        /* 這邊用不到
        // Action Result 之前
        public override void OnResultExecuting(ResultExecutingContext filterContext) 
        {
        }
        // Action Result 之後
        public override void OnResultExecuted(ResultExecutedContext filterContext) 
        {
        }
        */

        // 確認帳號密碼是否相符(密碼已先轉換) 回傳group(string)
        private string CheckLoginData(string uid, string upw)
        {
            try
            {
                using (NpgsqlConnection connection = new NpgsqlConnection(ConfigurationManager.AppSettings["DB"])) //連線 用web.config裡的地址
                {
                    connection.Open();
                    // 密碼用SHA256轉換
                    //string upwsha256 = ComputeSha256Hash(upw);
                    string strSQL = @"SELECT str_userid, str_passwd ,str_permission FROM public.account WHERE str_userid = @account AND str_passwd = @password;"; //找尋帳號與密碼都相同的資料
                    using (var cmd = new NpgsqlCommand(strSQL, connection))
                    {
                        // 預防SQL Injection
                        cmd.Parameters.AddWithValue("@account", uid);
                        cmd.Parameters.AddWithValue("@password", upw);
                        NpgsqlDataReader reader = cmd.ExecuteReader();
                        if (reader.Read())
                        {
                            string TempGrorp = reader["str_permission"].ToString();
                            cmd.Dispose();
                            connection.Close();
                            return TempGrorp;
                        }
                    }
                }
                return "";
            }
            catch (Exception ex)
            {
                string error = ex.ToString();
                return "";
            }
        }
        // 回傳紀錄給DB
        private void LogState (bool state, string type, string uid)
        {
            using (NpgsqlConnection connection = new NpgsqlConnection(ConfigurationManager.AppSettings["DB"])) //連線 用web.config裡的地址
            {
                connection.Open();
                string strSQL = @"INSERT INTO public.logstate(boo_state, str_type, str_uid, tsp_time) VALUES(@state, @type, @uid, @time);"; //找尋帳號與密碼都相同的資料
                using (var cmd = new NpgsqlCommand(strSQL, connection))
                {
                    cmd.Parameters.AddWithValue("@state", state);
                    cmd.Parameters.AddWithValue("@type", type); //login and logout
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