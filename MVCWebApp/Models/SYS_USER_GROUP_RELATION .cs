using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MVCWebApp.Models
{
    public class SYS_USER_GROUP_RELATION
    {
        public String USERID { get; set; }
        public int GROUP_ID { get; set; }
        public DateTime CREATE_DATE { get; set; } //新增時間
        public String CREATE_ID { get; set; }  //新增操作者
        public DateTime UPD_DATE { get; set; } //修改時間
        public String UPD_ID { get; set; } //修改操作者

    }
}