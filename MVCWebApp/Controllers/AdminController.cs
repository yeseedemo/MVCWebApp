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
            return View();
        }
    }
}