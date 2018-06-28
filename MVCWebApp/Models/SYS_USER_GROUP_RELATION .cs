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
        public DateTime CREATE_DATE { get; set; }
        public String CREATE_ID { get; set; }
        public DateTime UPD_DATE { get; set; }
        public String UPD_ID { get; set; }

    }
}