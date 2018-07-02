using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MVCWebApp.Controllers
{
    public class UserController : Controller
    {
        // GET: User
        public ActionResult DB_User()
        {
            //確保別的使用者或未登入者不會進來
                switch (Session["key"])
            {
                case "USER":
                    return View();

                case "ADMIN":
                    return new RedirectResult(Url.Action("DB_Admin", "Admin"));
                default:
                    return new RedirectResult(Url.Action("Login", "Account"));
            }
        }
    }
}