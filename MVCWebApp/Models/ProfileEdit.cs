using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MVCWebApp.Models
{
    public class ProfileEdit
    {
        // 密碼1
        [Display(Name = "新密碼")]
        [MaxLength(20, ErrorMessage = "密碼最多20個字")]
        [MinLength(4, ErrorMessage = "密碼最少4個字")]
        [DataType(DataType.Password)]
        public String upw { get; set; } //長度

        // 密碼2
        [Display(Name = "新密碼驗證")]
        [DataType(DataType.Password)]
        [MaxLength(20, ErrorMessage = "密碼最多20個字")]
        [MinLength(4, ErrorMessage = "密碼最少4個字")]
        [System.ComponentModel.DataAnnotations.Compare("upw", ErrorMessage = "密碼與確認密碼不符")]
        public String repw { get; set; } //與第一次相同

        // 舊密碼0
        [Display(Name = "當前密碼")]
        [MaxLength(20, ErrorMessage = "密碼最多20個字")]
        [MinLength(4, ErrorMessage = "密碼最少4個字")]
        [DataType(DataType.Password)]
        public String oldpw { get; set; } //無條件

        // 信箱驗證
        [Display(Name = "E-mail")]
        [EmailAddress(ErrorMessage = "請輸入正確的Email格式")] //檢查email格式
        public String email { get; set; }

        //確認刪除
        public String deleteAC { get; set; }
    }
}