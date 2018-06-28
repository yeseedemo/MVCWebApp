using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MVCWebApp.Models
{
    public class SYS_GROUP_PERMISSION
    {
        public String GROUP_ID { get; set; }
        public String FUNCTION_ID { get; set; }
        public String CAN_CREATE { get; set; }
        public String CAN_SEARCH { get; set; }
        public String CAN_UPDATE { get; set; }
        public String CAN_DELETE { get; set; }
        public String CAN_PRINT { get; set; }
        public DateTime CREATE_DATE { get; set; }
        public String CREATE_ID { get; set; }
        public DateTime UPD_DATE { get; set; }
        public String UPD_ID { get; set; }
    }
}