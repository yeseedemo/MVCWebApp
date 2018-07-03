using Newtonsoft.Json;
using PagedList;
using ServiceStack;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web.Mvc;

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
    }
}