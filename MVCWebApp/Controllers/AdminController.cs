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
        // GET: Admin
        public ActionResult DB_Admin()
        {
            //確保別的使用者或未登入者不會進來
            switch (Session["key"])
            {
                case "USER":
                    return new RedirectResult(Url.Action("DB_User", "User"));
                case "ADMIN":
                    return View();
                default:
                    return new RedirectResult(Url.Action("Login", "Account"));
            }
        }

        public ActionResult USR_Admin()
        {
            //確保別的使用者或未登入者不會進來
            /*
            switch (Session["key"])
            {
                case "USER":
                    return new RedirectResult(Url.Action("DB_User", "User"));
                case "ADMIN":
                    break;
                default:
                    return new RedirectResult(Url.Action("Login", "Account"));
            }
            */
            
            DataTable dt;
            getUSR(out dt);

            USR model = new USR();

            return View();
        }

        public void getUSR(out DataTable dt)
        {

            dt = new DataTable();
            dt.Columns.Add("uid",typeof(String));
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
    }
}