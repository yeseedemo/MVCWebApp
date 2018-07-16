using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Inventory.Infrastructure;

namespace MVCWebApp.Controllers
{
    [GroupAuthAttribute]
    public class UserController : Controller
    {
        // GET: User
        public ActionResult DB_User()
        {
            return View();
        }
    }
}