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
                    Response.Redirect("~/Admin/DB_Admin");
                    return new EmptyResult();
                default:
                    Response.Redirect("~/Account/Login");
                    return new EmptyResult();
            }
        }
    }
}