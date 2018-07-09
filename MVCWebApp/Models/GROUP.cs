using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MVCWebApp.Models
{
    public class GROUP
    {
        public bool A { get; set; } // admin新增
        public bool B { get; set; } // admin查詢
        public bool C { get; set; } // admin修改
        public bool D { get; set; } // admin刪除
        public bool E { get; set; } // user新增(admin)
        public bool F { get; set; } // user查詢(admin)
        public bool G { get; set; } // user修改(admin)
        public bool H { get; set; } // user刪除(admin)
        public bool I { get; set; } // user新增
        public bool J { get; set; } // user查詢
        public bool K { get; set; } // user修改
        public bool L { get; set; } // user刪除
    }
}