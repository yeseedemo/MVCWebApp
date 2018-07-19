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
using X.PagedList;
using ServiceStack.Templates;
using System.Collections.Specialized;
using Inventory.Infrastructure;
using MVCWebApp.helper;

namespace MVCWebApp.Controllers
{
    [GroupAuthAttribute]
    public class AdminController : Controller
    {
        # region > 統一實作DataTable抓DB資料
        public void GetDataTable(out DataTable dt, string strSQL, Dictionary<string, Type> dicModel)
        {
        
            dt = new DataTable();
            // 查字典去創造dt的Columns
            foreach (KeyValuePair<string, Type> item in dicModel)
            {
                dt.Columns.Add(item.Key, item.Value);
            }
            // 連結資料庫
            using (NpgsqlConnection connection = new NpgsqlConnection(ConfigurationManager.AppSettings["DB"])) //連線 用web.config裡的地址
            {
                connection.Open();
                using (NpgsqlCommand cmd = new NpgsqlCommand(strSQL, connection))
                {
                    NpgsqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        DataRow row = dt.NewRow();
                        foreach (KeyValuePair<string, Type> item in dicModel)
                        {
                            row[item.Key] = reader[item.Key];
                        }
                        dt.Rows.Add(row);
                    }
                    cmd.Dispose();
                    connection.Close();
                }
            }
        }
        #endregion

        #region > 修改群組
        public void ChangeGroup(string uid, string group)
        {
            using (NpgsqlConnection connection = new NpgsqlConnection(ConfigurationManager.AppSettings["DB"])) //連線 用web.config裡的地址
            {
                connection.Open();
                string strSQL = @"UPDATE public.sy_user_group_relation SET group_id = @group, upd_date = now(), upd_id = @upid WHERE user_id = @uid;";
                using (var cmd = new NpgsqlCommand(strSQL, connection))
                {
                    cmd.Parameters.AddWithValue("@uid", uid); // 被修改人
                    cmd.Parameters.AddWithValue("@upid", Session["uid"]); //修改者
                    //被修改者群組
                    if (group == "1")
                    {
                        cmd.Parameters.AddWithValue("@group", "Admin");
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@group", "User");
                    }
                    cmd.ExecuteNonQuery(); //執行修改
                    cmd.Dispose();
                    connection.Close();
                }
            }
        }
        #endregion

        //用戶資料編輯
        public ActionResult DB_Admin()
        {
            return View();
        }
        List<USR> USRshow = new List<USR>();
        public ActionResult USR_Admin(int? page)
        {
            DataTable dt;
            string strSQL = @"SELECT str_userid, str_permission, str_email FROM public.account ORDER BY str_userid ASC";
            Dictionary<string, Type> dicModel = new Dictionary<string, Type>();
            dicModel.Add("str_userid", typeof(string));
            dicModel.Add("str_permission", typeof(string));
            dicModel.Add("str_email", typeof(string));

            GetDataTable(out dt, strSQL, dicModel);
            //把使用者資訊一行一行印出來
            foreach (DataRow dr in dt.Rows)
            {
                USRshow.Add(new USR()
                {
                    uid = (string)Convert.ChangeType(dr["str_userid"], typeof(string)),
                    email = (string)Convert.ChangeType(dr["str_email"], typeof(string)),
                    per = (string)Convert.ChangeType(dr["str_permission"], typeof(string))
                });
            }

            var products = USRshow; //資料集
            var pageNumber = page ?? 1; //預設分頁
            var onePageOfUSR = products.ToPagedList(pageNumber, 5); //每頁長度

            ViewBag.OnePageOfUSR = onePageOfUSR;
            return View();
        }

        // 修改資訊
        public ActionResult USR_Edit(string id)
        {
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

        // 刪除帳號
        public ActionResult USR_Delete(string id)
        {
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
                    string upwsha256 = ComputeHelper.ComputeSha256Hash(upw);
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

        // 權限編輯
        public ActionResult Group_Edit()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Group_Edit(GROUP post)
        {
            using (NpgsqlConnection connection = new NpgsqlConnection(ConfigurationManager.AppSettings["DB"])) //連線 用web.config裡的地址
            {
                connection.Open();
                string strSQL = @"DELETE FROM public.sy_group_permission WHERE group_function_id > 0;"; //刪除之前紀錄

                using (var cmd = new NpgsqlCommand(strSQL, connection))
                {
                    cmd.ExecuteNonQuery();
                    cmd.Dispose();
                    connection.Close();
                }
                for (int n = 1; n <= 12; n++)
                {
                    connection.Open();
                    strSQL = @"INSERT INTO public.sy_group_permission(group_function_id, group_id, function_id, can_create, can_search, can_update, can_delete) VALUES(@group_function_id, @group_id, @function_id,"; //刪除之前紀錄

                    String function_id = String.Format("{0:000000}", Convert.ToInt16(n));
                    string strSQL2 = " 0, 0, 0, 0);";
                    // 權限
                    switch (n)
                    {
                        case 1:
                        case 5:
                        case 9:
                            if (post.A || post.E || post.I)
                            {
                                strSQL2 = " 1, null, null, null);";
                            }
                            break;
                        case 2:
                        case 6:
                        case 10:
                            if (post.B || post.F || post.J)
                            {
                                strSQL2 = " null, 1, null, null);";
                            }
                            break;
                        case 3:
                        case 7:
                        case 11:
                            if (post.C || post.G || post.K)
                            {
                                strSQL2 = " null, null, 1, null);";
                            }
                            break;
                        case 4:
                        case 8:
                        case 12:
                            if (post.D || post.H || post.L)
                            {
                                strSQL2 = " null, null, null, 1);";
                            }
                            break;
                    }
                    strSQL = strSQL + strSQL2;
                    using (var cmd = new NpgsqlCommand(strSQL, connection))
                    {
                        {
                            // 前兩個欄位
                            if (n <= 8)
                            {
                                cmd.Parameters.AddWithValue("@group_function_id", 1);
                                cmd.Parameters.AddWithValue("@group_id", "admin");
                            }
                            else
                            {
                                cmd.Parameters.AddWithValue("@group_function_id", 2);
                                cmd.Parameters.AddWithValue("@group_id", "user");
                            }
                            // 第三個欄位
                            cmd.Parameters.AddWithValue("@function_id", function_id);
                            cmd.ExecuteNonQuery();
                            cmd.Dispose();
                            connection.Close();
                        }
                    }
                }
                ViewBag.Msg = "修改完成";
                return View();
            }
        }

        // 用戶群組管理
        List<SYS_USER_GROUP_RELATION> ShowGroup = new List<SYS_USER_GROUP_RELATION>();
        public ActionResult GroupRelation(int? page)
        {
            DataTable dt;
            string strSQL = @"SELECT user_id, group_id, create_date, create_id, upd_date, upd_id FROM public.sy_user_group_relation ORDER BY user_id ASC";
            Dictionary<string, Type> dicModel = new Dictionary<string, Type>();
            dicModel.Add("user_id", typeof(string));
            dicModel.Add("group_id", typeof(string));
            dicModel.Add("create_date", typeof(DateTime));
            dicModel.Add("create_id", typeof(string));
            dicModel.Add("upd_date", typeof(DateTime));
            dicModel.Add("upd_id", typeof(string));

            GetDataTable(out dt, strSQL, dicModel);
            //把使用者資訊一行一行印出來
            foreach (DataRow dr in dt.Rows)
            {
                ShowGroup.Add(new SYS_USER_GROUP_RELATION()
                {
                    USERID = (string)Convert.ChangeType(dr["user_id"], typeof(string)),
                    GROUP_ID = (string)Convert.ChangeType(dr["group_id"], typeof(string)),
                    CREATE_DATE = (DateTime)Convert.ChangeType(dr["create_date"], typeof(DateTime)),
                    CREATE_ID = (string)Convert.ChangeType(dr["create_id"], typeof(string)),
                    UPD_DATE = (DateTime)Convert.ChangeType(dr["upd_date"], typeof(DateTime)),
                    UPD_ID = (string)Convert.ChangeType(dr["upd_id"], typeof(string)),
                });
            }
            var products = ShowGroup; //資料集
            var pageNumber = page ?? 1; //預設分頁
            var onePageOfGROUP = products.ToPagedList(pageNumber, 4); //每頁長度     
            ViewBag.OnePageOfGROUP = onePageOfGROUP; //回傳view
            //變更群組用的下拉選單
            List<SelectListItem> Groups = new List<SelectListItem>();
            Groups.Add(new SelectListItem { Text = "不修改", Value = "0" });
            Groups.Add(new SelectListItem { Text = "Admin", Value = "1" });
            Groups.Add(new SelectListItem { Text = "User", Value = "2" });
            ViewBag.GroupType = Groups;

            return View();
        }
        [HttpPost]
        public ActionResult GroupRelation(FormCollection post)
        {
            var uid = post["uid"].Split(',');
            var group = post["GroupType"].Split(',');
            int count = 0;
            foreach (string n in group)
            {
                if (n != "0")
                {
                    ChangeGroup(uid[count], n);
                }
                count++;
            }
            TempData["msg"] = "修改完成";
            return Redirect(Request.UrlReferrer.ToString()); ;
        }

        // 顯示登出入紀錄
        List<LOGSTATE> ShowState = new List<LOGSTATE>();
        public ActionResult LogState(int? page)
        {
            DataTable dt;
            string strSQL = @"SELECT boo_state, str_uid, str_type, tsp_time FROM public.logstate;"; // 要換掉的語法
            Dictionary<string, Type> dicModel = new Dictionary<string,Type>();
            dicModel.Add("boo_state", typeof(bool));
            dicModel.Add("str_uid", typeof(string));
            dicModel.Add("str_type", typeof(string));
            dicModel.Add("tsp_time", typeof(DateTime));

            GetDataTable(out dt, strSQL, dicModel);
            foreach (DataRow dr in dt.Rows)
            {
                ShowState.Add(new LOGSTATE()
                {
                    boo_state = (bool) Convert.ChangeType(dr["boo_state"], typeof(bool)),
                    str_uid = (string) Convert.ChangeType(dr["str_uid"], typeof(string)),
                    str_type = (string) Convert.ChangeType(dr["str_type"], typeof(string)),
                    tsp_time = (DateTime) Convert.ChangeType(dr["tsp_time"], typeof(DateTime))
                });
            }
            var Log = ShowState; //資料集
            var pageNumber = page ?? 1; //預設分頁
            var onePageOfLog = Log.ToPagedList(pageNumber, 10); //每頁長度     
            ViewBag.OnePage = onePageOfLog; //回傳view
            return View();
        }

        /* 過濾使用get 不需要用到post傳
        [HttpPost]
        public ActionResult LogState(FormCollection post)
        {
            return View();
        }
        */
    }
}

/* 檢視參考網頁
 * https://docs.microsoft.com/zh-tw/aspnet/mvc/overview/getting-started/database-first-development/customizing-a-view
 * https://dotblogs.com.tw/brooke/2016/06/26/020456
 * 
 * 互動視窗
 * http://bootstrap.hexschool.com/docs/4.0/components/modal/
 */
