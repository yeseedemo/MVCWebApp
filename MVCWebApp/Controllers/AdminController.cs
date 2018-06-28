using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
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
                    Response.Redirect("~/User/DB_User");
                    return new EmptyResult();
                case "ADMIN":
                    return View();
                default:
                    Response.Redirect("~/Account/Login");
                    return new EmptyResult();
            }
        }
    }
}