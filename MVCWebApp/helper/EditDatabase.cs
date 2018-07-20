using Npgsql;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

namespace MVCWebApp.helper
{
    public class EditDatabase
    {
        // 修改群組
        public static void ChangeGroup(string uid, string group, string upd_id)
        {
            using (NpgsqlConnection connection = new NpgsqlConnection(ConfigurationManager.AppSettings["DB"])) //連線 用web.config裡的地址
            {
                connection.Open();
                string strSQL = @"UPDATE public.sy_user_group_relation SET group_id = @group, upd_date = now(), upd_id = @upid WHERE user_id = @uid;";
                using (var cmd = new NpgsqlCommand(strSQL, connection))
                {
                    cmd.Parameters.AddWithValue("@uid", uid); // 被修改人
                    cmd.Parameters.AddWithValue("@upid", (string)upd_id); //修改者
                    //被修改者群組
                    switch (group)
                    {
                        case "admin":
                            cmd.Parameters.AddWithValue("@group", "Admin");
                            break;
                        case "user":
                            cmd.Parameters.AddWithValue("@group", "User");
                            break;
                    }
                    cmd.ExecuteNonQuery(); //執行修改
                    cmd.Dispose();
                    connection.Close();
                }
            }
        }
        // 註冊功能
        public static bool SignDB(string uid, string upw1, string email)
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
        // 修改個人資料
        public static string [] EditProfile(string uid, string upw, string NewPW, bool pwMatch, string NewMail, bool Delete)
        {
            string upwsha256 = ComputeHelper.ComputeSha256Hash(upw); //舊密碼 驗證用
            string [] result;
            using (NpgsqlConnection connection = new NpgsqlConnection(ConfigurationManager.AppSettings["DB"])) //連線 用web.config裡的地址
            {
                connection.Open();
                string strSQL = @" WHERE str_userid = @account AND str_passwd = @password;"; //通用
                //要改密碼
                if (pwMatch && NewPW  != null)
                {
                    string newha256 = ComputeHelper.ComputeSha256Hash(NewPW);
                    string ComboSentence = "UPDATE public.account SET str_passwd = '" + newha256 + "'" + strSQL;
                    using (var cmd = new NpgsqlCommand(ComboSentence, connection))
                    {
                        cmd.Parameters.AddWithValue("@account", uid); // 用戶ID
                        cmd.Parameters.AddWithValue("@password", upwsha256); //舊密碼
                        // NpgsqlDataReader reader = cmd.ExecuteReader();
                        if (cmd.ExecuteNonQuery() == 1) //成功就轉跳
                        {
                            cmd.Dispose();
                            connection.Close();
                            return result = new string[] { "true", "密碼修改完成，請重新登入！" };
                        }
                        else
                        {
                            return result = new string [] { "false" , "輸入資料有誤，請重新輸入"};
                        }
                    }
                }
                // 改email
                else if (NewMail != null)
                {
                    string ComboSentence = "UPDATE public.account SET str_email = '" + NewMail + "'"+ strSQL;
                    using (var cmd = new NpgsqlCommand(ComboSentence, connection))
                    {
                        cmd.Parameters.AddWithValue("@account", uid); // 用戶ID
                        cmd.Parameters.AddWithValue("@password", upwsha256); //舊密碼
                        // NpgsqlDataReader reader = cmd.ExecuteReader();
                        if (cmd.ExecuteNonQuery() == 1) //成功就轉跳
                        {
                            cmd.Dispose();
                            connection.Close();
                            return result = new string[] { "true", "電子信箱修改完成，請重新登入！" };
                        }
                        else
                        {
                            return result = new string[] { "false", "輸入資料有誤，請重新輸入" };
                        }
                    }
                }
                // 刪除帳號
                else if (Delete)
                {
                    string ComboSentence = "DELETE FROM public.account" + strSQL;
                    using (var cmd = new NpgsqlCommand(ComboSentence, connection))
                    {
                        cmd.Parameters.AddWithValue("@account", uid); // 用戶ID
                        cmd.Parameters.AddWithValue("@password", upwsha256); //舊密碼
                        // NpgsqlDataReader reader = cmd.ExecuteReader();
                        if (cmd.ExecuteNonQuery() == 1) //成功就轉跳
                        {
                            cmd.Dispose();
                            connection.Close();
                            return result = new string[] { "true", "帳號已刪除，感謝使用本系統！" };
                        }
                    }
                }
                return result = new string[] { "false", "沒有修改，資料未更變" }; ;
            }
        }
    }
}