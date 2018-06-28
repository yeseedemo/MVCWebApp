using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Npgsql;
using System.Configuration;
using MVCWebApp.Models;

namespace MVCWebApp.Controllers
{
    public class AccountController : Controller
    {
        public static string temp;

        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login(ACCOUNT post)
        {
            string userid = post.uid;
            string userpw = post.upw;

            //驗證密碼
            if (CheckLoginData(userid, userpw))
            {
                switch(temp)
                {
                    case "USER" :
                        Response.Redirect("~/User/DB_User");
                        return new EmptyResult();

                    case "ADMIN" :
                        Response.Redirect("~/Admin/DB_Admin");
                        return new EmptyResult();
                }
                ViewBag.Msg = "此帳號發生問題";
                return View();
            }
            else
            {
                ViewBag.Msg = "登入失敗...";
                return View();
            }
        }

        public bool CheckLoginData(string uid, string upw)
        {
            try
            {
                using (NpgsqlConnection connection = new NpgsqlConnection(ConfigurationManager.AppSettings["DB"])) //連線 用web.config裡的地址
                {
                    connection.Open();
                    string strSQL = @"SELECT * FROM public.account WHERE ""STR_userid"" = '" + uid + @"' AND ""STR_passwd"" = '" + upw + "';";
                    using (var cmd = new NpgsqlCommand(strSQL, connection))
                    using (NpgsqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read()) {
                            string temp = reader["STR_permission"].ToString(); //想辦法回傳
                            connection.Close();
                            return true;
                        }
                    }
                }
                return false;
            }
            catch (Exception ex)
            {
                string error = ex.ToString();

                return false;
            }
        }
    }
}