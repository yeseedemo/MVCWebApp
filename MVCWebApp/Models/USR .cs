using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace MVCWebApp.Models
{
    public class USR
    {
        [Display(Name = "帳號")]
        public String uid { get; set; } //ID
        [Display(Name = "Email")]
        public String email { get; set; } //EMAIL
        [Display(Name = "群組")]
        public String per { get; set; } //PERMISSION
    }
}