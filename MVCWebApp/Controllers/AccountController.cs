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
            if (ModelState.IsValid) // 用model驗證
            {
                if (EditDatabase.SignDB(userid, userpw, email)) //返回結果
                {
                    TempData["Msg2"] = "註冊成功，請登入！"; // 成功註冊，請用戶登入
                    return new RedirectResult(Url.Action("Login", "Account"));
                }
            }
            ViewBag.Msg = "註冊失敗，請檢查一下欄位！"; // 帳號或密碼沒有對應
            return View();
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
            string uid = (string)Session["uid"]; //舊ID
            string upw = post.oldpw; //舊密碼

            string NewPW = post.upw; //新密碼
            bool pwMatch = ModelState.IsValid;
            string NewMail = post.email; //新電子郵件
            bool Delete = false; //帳號刪除
            if (post.deleteAC == "check")
            {
                Delete = true;
            }

            // 修改個人資料
            string [] result = EditDatabase.EditProfile(uid, upw, NewPW, pwMatch, NewMail, Delete);
            if (Convert.ToBoolean(result[0]))
            {
                TempData["Msg2"] = result[1];
                return new RedirectResult(Url.Action("Login", "Account"));
            }
            else
            {
                ViewBag.Msg3 = result[1];
                return View();
            }
        }
    }
}


/*
 *  參考資料
 *  
 *  https://ithelp.ithome.com.tw/users/20105694/ironman/1329?page=3 <<系列
*/


