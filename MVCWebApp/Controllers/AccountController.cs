using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Npgsql;
using System.Configuration;
using MVCWebApp.Models;
using System.Data;

namespace MVCWebApp.Controllers
{
    public class AccountController : Controller
    {
        public static string temp; //給判斷用戶群組用的暫存

        // 正常註冊頁面(get模式)
        public ActionResult Signin()
        {
            if (Session["key"] != null) //如果有Session直接轉跳X1
            {
                switch (Session["key"])
                {
                    case "USER":
                        Response.Redirect("~/User/DB_User");
                        return new EmptyResult();

                    case "ADMIN":
                        Response.Redirect("~/Admin/DB_Admin");
                        return new EmptyResult();
                }
            }
            return View();
        }

        // 接收並註冊(post模式)
        [HttpPost]
        public ActionResult Signin(ACCOUNT post)
        {
            string userid = post.uid;
            string userpw = post.upw;
            string userpw2 = post.repw;

            //呼叫創建
            if (goSignin(userid, userpw , userpw2))
            {
                TempData["Msg2"] = "註冊成功，請登入"; // 成功註冊，請用戶登入
                Response.Redirect("~/Account/Login");
                return new EmptyResult();
            }
            else
            {
                ViewBag.Msg = "兩次密碼不一致，請重新輸入"; // 帳號或密碼沒有對應
                return View();
            }
        }
        //確認兩次密碼一致並註冊
        public bool goSignin(string uid, string upw1, string upw2)
        {
            if (upw1 == upw2) //驗證兩次密碼是否一致
            {
                try
                {
                    using (NpgsqlConnection connection = new NpgsqlConnection(ConfigurationManager.AppSettings["DB"])) //連線 用web.config裡的地址
                    {
                        connection.Open();
                        // 之後密碼用SHA256轉換
                        string strSQL = @"INSERT INTO public.account(""STR_userid"", ""STR_passwd"", ""STR_permission"")VALUES ('" + uid + @"', '" + upw1 + @"','USER' ); "; //新增一筆用戶資料
                        NpgsqlCommand cmd = new NpgsqlCommand(strSQL, connection);
                        cmd.Dispose();
                        connection.Close();
                        return true;
                    }
                }
                catch(Exception ex)
                {
                    string error = ex.ToString();
                    return false;
                }
                    
            }
            return false; //兩次密碼不同
        }

        // 正常登入頁面(get模式)
        public ActionResult Login()
        {
            if (Session["key"] != null) //如果有Session直接轉跳X2
            {
                switch (Session["key"])
                {
                    case "USER":
                        Response.Redirect("~/User/DB_User");
                        return new EmptyResult();

                    case "ADMIN":
                        Response.Redirect("~/Admin/DB_Admin");
                        return new EmptyResult();
                }
            }
            return View();
        }        
        
        // 接收並驗證(post模式)
        [HttpPost]
        public ActionResult Login(ACCOUNT post)
        {
            string userid = post.uid;
            string userpw = post.upw;

            // 呼叫驗證
            if (CheckLoginData(userid, userpw))
            {
                // 選擇群組
                switch(AccountController.temp)
                {
                    case "USER" :
                        Response.Redirect("~/User/DB_User");
                        return new EmptyResult();

                    case "ADMIN" :
                        Response.Redirect("~/Admin/DB_Admin");
                        return new EmptyResult();
                }
                ViewBag.Msg = "此帳號發生問題，請聯絡管理人員"; // 沒有群組對應
                return View();
            }
            else
            {
                ViewBag.Msg = "帳號或密碼錯誤，請重新輸入"; // 帳號或密碼沒有對應
                return View();
            }
        }
        
        // 確認帳號密碼是否相符
        public bool CheckLoginData(string uid, string upw)
        {
            try
            {
                using (NpgsqlConnection connection = new NpgsqlConnection(ConfigurationManager.AppSettings["DB"])) //連線 用web.config裡的地址
                {
                    connection.Open();
                    // 之後要先把密碼用SHA256轉換
                    string strSQL = @"SELECT * FROM public.account WHERE ""STR_userid"" = '" + uid + @"' AND ""STR_passwd"" = '" + upw + "';"; //找尋帳號與密碼都相同的資料 (有漏洞待修改)
                    using (var cmd = new NpgsqlCommand(strSQL, connection))
                    using (NpgsqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read()) {
                            AccountController.temp = reader["STR_permission"].ToString(); // 抓取群組
                            Session["key"] = temp; // Session狀態加入用戶id
                            cmd.Dispose();
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
        
        // 登出
        public ActionResult Logout()
        {
            Session.Clear();
            return View();
        }
    }
}

/*
 *  參考資料
 *  
 *  https://ithelp.ithome.com.tw/users/20105694/ironman/1329?page=3 <<系列
 * https://read01.com/zh-tw/J0N7ED.html#.WzSJmNIzYdU << 加密相關
*/
