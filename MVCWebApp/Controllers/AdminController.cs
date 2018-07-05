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

        #region > 把密碼用SHA256計算
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
            return View(USRshow);
        }

        //修改資訊
        public ActionResult USR_Edit(string id)
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

            string userid = id; //要刪除的資料
            Session["select"] = userid; //先把選擇的ID記下

            return View();
        }
        [HttpPost]
        public ActionResult USR_Edit(USR post)
        {
            string adminid = (string)Session["uid"]; //管理員ID
            string adminpw = post.upw; //管理員pw
            string userid = (string)Session["select"]; //選擇的使用者
            
            //要修改的資料
            string email = post.email; //用戶email
            string per = post.per; ///用戶群組

            // 先確認管理者密碼
            if (CheckPW(adminid, adminpw))
            {
                //執行修改
                try
                {
                    if (ModelState.IsValid)
                    {
                        using (NpgsqlConnection connection = new NpgsqlConnection(ConfigurationManager.AppSettings["DB"])) //連線 用web.config裡的地址
                        {
                            connection.Open();
                            string strSQL = @"UPDATE public.account SET str_permission= @per , str_email= @email WHERE str_userid= @account";
                            using (var cmd = new NpgsqlCommand(strSQL, connection))
                            {
                                cmd.Parameters.AddWithValue("@per", per);
                                cmd.Parameters.AddWithValue("@email", email);
                                cmd.Parameters.AddWithValue("@account", userid);

                                cmd.ExecuteNonQuery(); //執行修改
                                cmd.Dispose();
                                connection.Close();

                            }
                        }
                        //提示成功字樣
                        TempData["result"] = "修改成功";
                        //返回查詢頁
                        return new RedirectResult(Url.Action("USR_Admin", "Admin"));
                    }
                    return View();
                }
                catch (Exception ex)
                {
                    string error = ex.ToString();
                    return View();
                }
            }
            else
            {
                //回報
                ViewBag.Msg = "密碼輸入錯誤，請重新輸入";
                return View();
            }
        }

        //刪除帳號
        public ActionResult USR_Delete(string id)
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

            string userid = id; //要刪除的資料
            Session["select"] = userid; //先把選擇的ID記下

            return View();
        }
        [HttpPost]
        public ActionResult USR_Delete(USR post)
        {
            string adminid = (string)Session["uid"]; //管理員ID
            string adminpw = post.upw; //管理員pw
            string userid = (string)Session["select"]; //選擇的使用者
            //驗證管理員密碼
            if (CheckPW(adminid, adminpw))
            {
                //刪除帳號
                try
                {
                    if (ModelState.IsValid)
                    {
                        using (NpgsqlConnection connection = new NpgsqlConnection(ConfigurationManager.AppSettings["DB"])) //連線 用web.config裡的地址
                        {
                            connection.Open();
                            string strSQL = @"DELETE FROM public.account WHERE str_userid = @account";
                            using (var cmd = new NpgsqlCommand(strSQL, connection))
                            {
                                cmd.Parameters.AddWithValue("@account", userid);
                                cmd.ExecuteNonQuery(); //刪除
                                cmd.Dispose();
                                connection.Close();

                            }
                        }
                        //提示成功字樣
                        TempData["result"] = "刪除成功";
                        //返回查詢頁
                        return new RedirectResult(Url.Action("USR_Admin", "Admin"));
                    }
                    return View();
                }
                catch (Exception ex)
                {
                    string error = ex.ToString();
                    return View();
                }
            }
            else
            {
                //回報
                ViewBag.Msg = "密碼輸入錯誤，請重新輸入";
                return View();
            }
        }

        // 驗證admin密碼
        public bool CheckPW(string uid, string upw)
        {
            try
            {
                using (NpgsqlConnection connection = new NpgsqlConnection(ConfigurationManager.AppSettings["DB"])) //連線 用web.config裡的地址
                {
                    connection.Open();
                    // 密碼用SHA256轉換
                    string upwsha256 = ComputeSha256Hash(upw);
                    string strSQL = @"SELECT str_userid, str_passwd FROM public.account WHERE str_userid = @account AND str_passwd = @password;";

                    using (var cmd = new NpgsqlCommand(strSQL, connection))
                    {
                        // 預防SQL Injection
                        cmd.Parameters.AddWithValue("@account", uid);
                        cmd.Parameters.AddWithValue("@password", upwsha256);
                        NpgsqlDataReader reader = cmd.ExecuteReader();

                        if (reader.Read())
                        {
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
    }
}

/* 檢視參考網頁
 * https://docs.microsoft.com/zh-tw/aspnet/mvc/overview/getting-started/database-first-development/customizing-a-view
 * https://dotblogs.com.tw/brooke/2016/06/26/020456
 * 
 * 互動視窗
 * http://bootstrap.hexschool.com/docs/4.0/components/modal/
 */
