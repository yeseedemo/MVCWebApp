using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MVCWebApp.Models
{
    public class APILOG
    {
        public int BINT_APILOGID { get; set; }
        public String STR_APINAME { get; set; }
        public String CHR_DIRECTION { get; set; }
        public String CHR_DEVICETYPE { get; set; }
        public String STR_HTTP { get; set; }
        public String STR_MESSAGEBODY { get; set; }
        public String STR_GUID { get; set; }
        public DateTime CREATE_DATE { get; set; }
        public String CREATE_ID { get; set; }
    }
}