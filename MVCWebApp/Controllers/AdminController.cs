using Newtonsoft.Json;
using PagedList;
using ServiceStack;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web.Mvc;
using MVCWebApp.Models;
using System.Data;
using Npgsql;
using System.Configuration;

namespace MVCWebApp.Controllers
{
    public class AdminController : Controller
    {
        #region > 確保別的使用者或未登入者不會進來
        public void swGroups()
        {
            
        }
        #endregion

        #region > 把使用者資料群組撈出來
        public void getUSR(out DataTable dt)
        {
            

            dt = new DataTable();
            dt.Columns.Add("uid", typeof(String));
            dt.Columns.Add("email", typeof(String));
            dt.Columns.Add("per", typeof(String));
            using (NpgsqlConnection connection = new NpgsqlConnection(ConfigurationManager.AppSettings["DB"])) //連線 用web.config裡的地址
            {
                connection.Open();
                string strSQL = @"SELECT str_userid, str_permission, str_email FROM public.account";
                using (NpgsqlCommand cmd = new NpgsqlCommand(strSQL, connection))
                {
                    NpgsqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        DataRow row = dt.NewRow();
                        row["uid"] = reader["str_userid"].ToString();
                        row["email"] = reader["str_email"].ToString();
                        row["per"] = reader["str_permission"].ToString();
                        dt.Rows.Add(row);
                    }

                    cmd.Dispose();
                    connection.Close();
                }
            }
        }
        #endregion

        public ActionResult DB_Admin()
        {
            switch (Session["key"])
            {
                case "USER":
                    return new RedirectResult(Url.Action("DB_User", "User"));
                case "ADMIN":
                    break;
                default:
                    return new RedirectResult(Url.Action("Login", "Account"));
            }
            return View();

        }

        List<USR> USRshow = new List<USR>();

        public ActionResult USR_Admin()
        {
            switch (Session["key"])
            {
                case "USER":
                    return new RedirectResult(Url.Action("DB_User", "User"));
                case "ADMIN":
                    break;
                default:
                    return new RedirectResult(Url.Action("Login", "Account"));
            }
            DataTable dt;
            getUSR(out dt);
            foreach (DataRow dr in dt.Rows)
            {
                USRshow.Add(new USR() { uid = dr["uid"].ToString(), email = dr["email"].ToString(), per = dr["per"].ToString() });
            }

            // USRshow.Add(new USR() { uid = "test", email = "123@123.com", per = "ADMIN" });

            return View(USRshow);
        }
        public ActionResult DeleteAC()
        {
            return View();
        }
        public ActionResult EditAC()
        {
            return View();
        }
    }
}

/* 檢視參考網頁
 * https://docs.microsoft.com/zh-tw/aspnet/mvc/overview/getting-started/database-first-development/customizing-a-view
 * https://dotblogs.com.tw/brooke/2016/06/26/020456
 * 
 * 互動視窗
 * http://bootstrap.hexschool.com/docs/4.0/components/modal/
 */
