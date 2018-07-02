using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Npgsql;
using System.Configuration;
using MVCWebApp.Models;
using System.Data;
using System.Security.Cryptography;

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
            string email = post.email;



            //呼叫創建
            if (goSignin(userid, userpw, email))
            {
                TempData["Msg2"] = "註冊成功，請登入！"; // 成功註冊，請用戶登入
                return new RedirectResult(Url.Action("Login", "Account"));
            }
            else
            {
                ViewBag.Msg = "註冊失敗，請檢查一下欄位！"; // 帳號或密碼沒有對應
                return View();
            }
        }
        //確認兩次密碼一致並註冊
        public bool goSignin(string uid, string upw1, string email)
        {
            try
            {
                if (ModelState.IsValid) // 如果model沒有報錯誤訊息才能通過
                {
                    using (NpgsqlConnection connection = new NpgsqlConnection(ConfigurationManager.AppSettings["DB"])) //連線 用web.config裡的地址
                    {
                        connection.Open();
                        // 密碼用SHA256轉換
                        string upwsha256 = ComputeSha256Hash(upw1);
                        string strSQL = @"INSERT INTO public.account(""STR_userid"", ""STR_passwd"", ""STR_permission"",""STR_email"")VALUES ( @account, @password,'USER',@email ); "; //新增一筆用戶資料
                        using (NpgsqlCommand cmd = new NpgsqlCommand(strSQL, connection))
                        {
                            // 預防SQL Injection
                            cmd.Parameters.AddWithValue("@account", uid);
                            cmd.Parameters.AddWithValue("@password", upwsha256);
                            cmd.Parameters.AddWithValue("@email", email);
                            cmd.ExecuteNonQuery();
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
        // 正常登入頁面(get模式)
        public ActionResult Login()
        {
            if (Session["key"] != null) //如果有Session直接轉跳X2
            {
                switch (Session["key"])
                {
                    case "USER":
                        return new RedirectResult(Url.Action("DB_User", "User"));
                    case "ADMIN":
                        return new RedirectResult(Url.Action("DB_Admin", "Admin"));
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
                switch (AccountController.temp)
                {
                    case "USER":
                        return new RedirectResult(Url.Action("DB_User", "User"));
                    case "ADMIN":
                        return new RedirectResult(Url.Action("DB_Admin", "Admin"));
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
                    // 密碼用SHA256轉換
                    string upwsha256 = ComputeSha256Hash(upw);
                    string strSQL = @"SELECT * FROM public.account WHERE ""STR_userid"" = @account AND ""STR_passwd"" = @password;"; //找尋帳號與密碼都相同的資料

                    using (var cmd = new NpgsqlCommand(strSQL, connection))
                    {
                        // 預防SQL Injection
                        cmd.Parameters.AddWithValue("@account", uid);
                        cmd.Parameters.AddWithValue("@password", upwsha256);
                        NpgsqlDataReader reader = cmd.ExecuteReader();

                        if (reader.Read())
                        {
                            AccountController.temp = reader["STR_permission"].ToString(); // 抓取群組
                            Session["key"] = temp; // Session狀態加入用戶群組
                            Session["uid"] = uid; // Session狀態加入用戶id
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

        // 確認帳號沒有重複
        
        [HttpPost]
        public ActionResult CheckAccount(string uid)
        {
            using (NpgsqlConnection connection = new NpgsqlConnection(ConfigurationManager.AppSettings["DB"])) //連線 用web.config裡的地址
            {
                connection.Open();
                string strSQL = @"SELECT * FROM public.account WHERE ""STR_userid"" = @account";
                using (var cmd = new NpgsqlCommand(strSQL, connection))
                {
                    // 預防SQL Injection
                    cmd.Parameters.AddWithValue("@account", uid);
                    NpgsqlDataReader reader = cmd.ExecuteReader();
                    if (reader.Read())
                    {
                        return Json("用户名" + uid + "已存在", JsonRequestBehavior.AllowGet);
                    }
                }
            }
            return Json(true, JsonRequestBehavior.AllowGet);
        }


        // 把密碼用SHA256計算
        static string ComputeSha256Hash(string rawData)
        {
            // Create a SHA256   
            using (SHA256 sha256Hash = SHA256.Create())
            {
                // ComputeHash - returns byte array  
                byte[] bytes = sha256Hash.ComputeHash(System.Text.Encoding.UTF8.GetBytes(rawData));

                // Convert byte array to a string   
                var builder = new System.Text.StringBuilder();
                for (int i = 0; i < bytes.Length; i++)
                {
                    builder.Append(bytes[i].ToString("x2"));
                }

                return builder.ToString();
            }
        }
        // 個人資訊頁面(get模式)
        public ActionResult Profile()
        {
            if (Session["key"] == null) //如果有Session直接轉跳X1
            {
                return new RedirectResult(Url.Action("Login", "Account"));
            }
            return View();
        }
        // 個人資訊頁面(post模式)
        [HttpPost]
        public ActionResult Profile(ACCOUNT post)
        {
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


