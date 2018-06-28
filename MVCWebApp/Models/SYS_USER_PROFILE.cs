using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MVCWebApp.Models
{
    public class SYS_USER_PROFILE
    {
        public String USERID { get; set; }
        public String NAME { get; set; }
        public String USER_CORP { get; set; }
        public String SER_DEPT { get; set; }
        public String USER_EMPNO { get; set; }
        public String USER_EMAIL { get; set; }
        public String USER_PWD { get; set; }
        public DateTime EFF_DATE_FROM { get; set; }
        public DateTime EFF_DATE_TO { get; set; }
	    public String USER_ALERT_PWD { get; set; }
	    public String USER_LEVEL { get; set; }
	    public String ONUSE { get; set; }
	    public DateTime CREATE_DATE { get; set; }
	    public String CREATE_ID { get; set; }
	    public DateTime UPD_DATE { get; set; }
	    public String UPD_ID { get; set; }
    }
}