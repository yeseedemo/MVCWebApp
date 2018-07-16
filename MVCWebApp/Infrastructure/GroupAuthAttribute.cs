using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace Inventory.Infrastructure
{
    public class GroupAuthAttribute : AuthorizeAttribute //繼承授權屬性
    {
        private string UsersGroup;
        private string OriginPath;
        private string NowPath;

        // 抓取參數 並呼叫檢查
        public override void OnAuthorization(AuthorizationContext filterContext)
        {
            UsersGroup = Convert.ToString(filterContext.HttpContext.Session["key"]); // 群組
            OriginPath = filterContext.RouteData.Values["controller"].ToString(); // 用戶來源
            NowPath = filterContext.RouteData.Values["action"].ToString(); // 用戶目的

            if (OriginPath != "Account" || NowPath == "Profile")
            {   
                CheckLogin(filterContext);
            }
            CheckPermission(filterContext);
        }
        
        // 查看有沒有登入
        private void CheckLogin(AuthorizationContext filterContext)
        {
            if (UsersGroup == "") // 群組是空的 所以沒登入
            {
                filterContext.Result = new RedirectResult("/Account/Login"); //回到登入頁
            }
        }
        // 查看有沒有權限在這頁
        private void CheckPermission(AuthorizationContext filterContext)
        {
            switch (OriginPath)
            {
                case "Admin":
                    if (UsersGroup != "ADMIN")
                    {
                        filterContext.Result = new RedirectResult("/User/DB_User");
                    }
                    break;
                case "User":
                    if (UsersGroup != "USER")
                    {
                        filterContext.Result = new RedirectResult("/Admin/DB_Admin");
                    }
                    break;
                default:
                    break;
            }
        }
    }
}


// 存取Session
// Convert.ToString(filterContext.HttpContext.Session["auth"]);
// 取得來源
// filterContext.RouteData.DataTokens.TryGetValue

    // 參考 https://www.uuu.com.tw/Public/content/article/16/161003tips.htm
// 從哪來 https://dotblogs.com.tw/lastsecret/2010/11/20/19577