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
            return View();
        }
    }
}