using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MVCWebApp.Models
{
    public class LOGSTATE
    {
        // [Display(Name = "結果")]
        public bool boo_state { get; set; }

        // [Display(Name = "操作帳號")]
        public string str_uid { get; set; }

        // [Display(Name = "行為")]
        public string str_type { get; set; }

        // [Display(Name = "發生時間")]
        public DateTime tsp_time { get; set; }
    }
}