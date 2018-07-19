using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Npgsql;
using System.Configuration;
using MVCWebApp.Models;
using System.Data;
using Inventory.Infrastructure;
using MVCWebApp.helper;

namespace MVCWebApp.Controllers
{
    public class AccountController : Controller
    {
        // 正常註冊頁面(get模式)
        [GroupAuthAttribute]
        public ActionResult Signin()
        {
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
            if (GoSignin(userid, userpw, email))
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

        //註冊功能
        public bool GoSignin(string uid, string upw1, string email)
        {
            if (ModelState.IsValid) // 如果model沒有報錯誤訊息才能通過
            {
                using (NpgsqlConnection connection = new NpgsqlConnection(ConfigurationManager.AppSettings["DB"])) //連線 用web.config裡的地址
                {
                    connection.Open();
                    // 密碼用SHA256轉換
                    string upwsha256 = ComputeHelper.ComputeSha256Hash(upw1);
                    string strSQL = @"INSERT INTO public.account(str_userid, str_passwd, str_permission,str_email)VALUES ( @account, @password,'USER',@email ); "; //新增一筆用戶資料
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

        // 正常登入頁面(get模式)
        [GroupAuthAttribute]
        public ActionResult Login()
        {
            return View();
        }
        // 接收並驗證(post模式)
        [HttpPost]
        [LogStateAttribute]
        public ActionResult Login(ACCOUNT post)
        {
            return View();
        }

        // 登出
        [LogStateAttribute]
        public ActionResult Logout()
        {
            return View();
        }

        // 確認帳號沒有重複
        [HttpPost]
        public ActionResult CheckAccount(string uid)
        {
            using (NpgsqlConnection connection = new NpgsqlConnection(ConfigurationManager.AppSettings["DB"])) //連線 用web.config裡的地址
            {
                connection.Open();
                string strSQL = @"SELECT str_userid FROM public.account WHERE str_userid = @account";
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

        // 個人資訊頁面(get模式)
        [GroupAuthAttribute]
        public ActionResult Profile()
        {
            return View();
        }
        // 個人資訊頁面(post模式)
        [HttpPost]
        public ActionResult Profile(ProfileEdit post)
        {
            string oldid = (string)Session["uid"]; //舊ID
            string newrpw = post.upw; //新密碼
            string oldrpw = post.oldpw; //舊密碼
            string newemail = post.email; //新電子郵件
            string delete = post.deleteAC; //帳號刪除

            using (NpgsqlConnection connection = new NpgsqlConnection(ConfigurationManager.AppSettings["DB"])) //連線 用web.config裡的地址
            {
                connection.Open();
                // 密碼用SHA256轉換
                string upwsha256 = ComputeHelper.ComputeSha256Hash(oldrpw);
                string strSQL = @"SELECT str_userid, str_passwd FROM public.account WHERE str_userid = @account AND str_passwd = @password;"; //找尋帳號與密碼都相同的資料

                using (var cmd = new NpgsqlCommand(strSQL, connection))
                {
                    // 預防SQL Injection
                    cmd.Parameters.AddWithValue("@account", oldid);
                    cmd.Parameters.AddWithValue("@password", upwsha256);
                    NpgsqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read()) //通過密碼驗證後
                    {
                        cmd.Dispose();
                        connection.Close();
                        //改密碼
                        if (newrpw != null)
                        {
                            if (ModelState.IsValid)
                            {
                                connection.Open();
                                string strSQL2 = @"UPDATE public.account SET str_passwd= @new WHERE str_userid= @old";
                                using (var cmd2 = new NpgsqlCommand(strSQL2, connection))
                                {
                                    string newha256 = ComputeHelper.ComputeSha256Hash(newrpw);
                                    cmd2.Parameters.AddWithValue("@new", newha256);
                                    cmd2.Parameters.AddWithValue("@old", oldid);
                                    cmd2.ExecuteNonQuery();
                                    cmd2.Dispose();
                                    connection.Close();
                                    TempData["Msg2"] = "密碼修改完成，請重新登入！"; // 成功註冊，請用戶登入
                                    Session.Clear();
                                    return new RedirectResult(Url.Action("Login", "Account"));
                                }
                            }
                            else
                            {
                                ViewBag.Msg3 = "輸入資料有誤，請重新輸入";
                            }
                        }
                        //改電郵地址
                        else if (newemail != null)
                        {
                            if (ModelState.IsValid)
                            {
                                connection.Open();
                                string strSQL2 = @"UPDATE public.account SET str_email= @new WHERE str_userid= @old";
                                using (var cmd2 = new NpgsqlCommand(strSQL2, connection))
                                {
                                    cmd2.Parameters.AddWithValue("@new", newemail);
                                    cmd2.Parameters.AddWithValue("@old", oldid);
                                    cmd2.ExecuteNonQuery();
                                    cmd2.Dispose();
                                    connection.Close();
                                    TempData["Msg2"] = "電子信箱修改完成，請重新登入！"; // 成功註冊，請用戶登入
                                    Session.Clear();
                                    return new RedirectResult(Url.Action("Login", "Account"));
                                }
                            }
                            else
                            {
                                ViewBag.Msg3 = "輸入資料有誤，請重新輸入";
                            }
                        }
                        //確認刪除
                        else if (delete != null)
                        {
                            connection.Open();
                            string strSQL2 = @"DELETE FROM public.account WHERE str_userid= @old";
                            using (var cmd2 = new NpgsqlCommand(strSQL2, connection))
                            {
                                cmd2.Parameters.AddWithValue("@old", oldid);
                                cmd2.ExecuteNonQuery();
                                cmd2.Dispose();
                                connection.Close();
                                TempData["Msg2"] = "帳號已刪除，感謝使用本系統！"; // 成功註冊，請用戶登入
                                Session.Clear();
                                return new RedirectResult(Url.Action("Login", "Account"));
                            }
                        }
                        else
                        {
                            ViewBag.Msg3 = "沒有修改，資料未更變";
                        }
                    }

                }
            }
            return View();
        }

    }
}


/*
 *  參考資料
 *  
 *  https://ithelp.ithome.com.tw/users/20105694/ironman/1329?page=3 <<系列
*/


