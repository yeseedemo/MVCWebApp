using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MVCWebApp.Models
{
    public class ACCOUNT
    {
        // 帳號限制 字元 長度 不重複
        [Required]
        [Display(Name = "帳號")]
        [RegularExpression(@"[a-zA-Z0-9]*$", ErrorMessage = "帳號僅能有英文或數字")]
        [MaxLength(20, ErrorMessage = "帳號最多20個字")]
        [MinLength(8, ErrorMessage = "帳號最少8個字")]
        [Remote("CheckAccount", "Account", HttpMethod = "POST"/*, ErrorMessage = "Email already exists"*/)] // 沒辦法運行
        public String uid { get; set; } //不要特殊符號

        //密碼限制 長度 
        [Required]
        [Display(Name = "密碼")]
        [MaxLength(20, ErrorMessage = "密碼最多20個字")]
        [MinLength(8, ErrorMessage = "密碼最少8個字")]
        [DataType(DataType.Password)]
        public String upw { get; set; } //長度

        // 密碼驗證
        [Required]
        [Display(Name = "密碼驗證")]
        [DataType(DataType.Password)]
        [System.ComponentModel.DataAnnotations.Compare("upw", ErrorMessage = "密碼與確認密碼不符")]
        public String repw { get; set; } //與第一次相同

        public String per { get; set; } //可能用不到

        // 信箱驗證
        [Required]
        [Display(Name = "E-mail")]
        [EmailAddress(ErrorMessage = "請輸入正確的Email格式")] //檢查email格式
        public String email { get; set; }
    }
}