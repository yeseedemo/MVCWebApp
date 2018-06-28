using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MVCWebApp.Models
{
    public class SYS_FUNCTION
    {
        public String FUNCTION_ID { get; set; }
        public String PARENT_FUNCTION_ID { get; set; }
        public String FUNCTION_NAME { get; set; }
        public double LEVEL_SEQ { get; set; }
        public double SEQ { get; set; }
        public String IS_VISIBLE { get; set; }
        public String IS_FUNCTION { get; set; }
        public String SINGLE_LOGIN { get; set; }
        public String FUNCTION_TYPE { get; set; }
        public DateTime CREATE_DATE { get; set; }
        public String CREATE_ID { get; set; }
        public DateTime UPD_DATE { get; set; }
        public String UPD_ID { get; set; }
        public String PROGRAM_ID { get; set; }
    }
}