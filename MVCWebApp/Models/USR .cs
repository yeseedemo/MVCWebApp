using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MVCWebApp.Models
{
    public class USR
    {
        [Display(Name = "帳號")]
        [RegularExpression(@"[a-zA-Z0-9]*$", ErrorMessage = "帳號僅能有英文或數字")]
        [MaxLength(20, ErrorMessage = "帳號最多20個字")]
        [MinLength(8, ErrorMessage = "帳號最少8個字")]
        [Remote("CheckAccount", "Account", HttpMethod = "POST")]
        public String uid { get; set; } //ID

        [Required]
        [Display(Name = "Email")]
        [EmailAddress(ErrorMessage = "請輸入正確的Email格式")]
        public String email { get; set; } //EMAIL

        [Required]
        [Display(Name = "群組")]
        public String per { get; set; } //群組

        [Required]
        [Display(Name = "管理者密碼")]
        [MaxLength(20, ErrorMessage = "密碼最多20個字")]
        [MinLength(8, ErrorMessage = "密碼最少8個字")]
        [DataType(DataType.Password)]
        public String upw { get; set; } //管理者密碼
    }
}