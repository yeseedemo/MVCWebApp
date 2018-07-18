using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace MVCWebApp.Models
{
    public class SYS_USER_GROUP_RELATION
    {
        [Display(Name = "使用者名稱")]
        public String USERID { get; set; }
        [Display(Name = "群組名稱")]
        public String GROUP_ID { get; set; }

        [Display(Name = "新增時間")]
        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}")]
        public DateTime CREATE_DATE { get; set; }


        [Display(Name = "新增人員")]
        public String CREATE_ID { get; set; }

        [Display(Name = "修改時間")]
        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}")]
        public DateTime UPD_DATE { get; set; }

        [Display(Name = "修改人員")]
        public String UPD_ID { get; set; }
    }
}