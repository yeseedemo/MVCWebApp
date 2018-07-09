using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MVCWebApp.Models
{
    public class SYS_GROUP_PERMISSION
    {
        public String GROUP_FUNCTION_ID { get; set; } // 1> ADMIN 2>USER
        public String GROUP_ID { get; set; } // 群組(ADMIN,USER)
        public String FUNCTION_ID { get; set; } // 
        public String CAN_CREATE { get; set; } // 新增
        public String CAN_SEARCH { get; set; } // 查詢
        public String CAN_UPDATE { get; set; } // 修改
        public String CAN_DELETE { get; set; } // 刪除
        public String CAN_PRINT { get; set; } // 空
        public DateTime CREATE_DATE { get; set; } // 空
        public String CREATE_ID { get; set; } // 空
        public DateTime UPD_DATE { get; set; } // 空
        public String UPD_ID { get; set; } // 空
    }
}