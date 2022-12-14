//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DBSportStore.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Web.Globalization;
    
    public partial class AdminUser
    {
        [Required(ErrorMessage = "ID not empty")]
        [Display(Name ="M? User")]
        public int ID { get; set; }
        [Required(ErrorMessage ="Name not empty!!!")]
        [StringLength(50,MinimumLength = 5)]
        [Display(Name ="T?n User")]
        public string NameUser { get; set; }
        [Display(Name ="V? tr?")]
        public string RoleUser { get; set; }
        [Display(Name ="Nh?p m?t kh?u")]
        [Required(ErrorMessage = "Password not empty!!!")]
        [DataType(DataType.Password)]   
        public string PasswordUser { get; set; }
        [NotMapped]
        [Compare("PasswordUser")]
        [DisplayName("Nh?p l?i m?t kh?u")]
        [DataType(DataType.Password)]
        public string ConfirmPass { get; set; }
        [NotMapped]
        public string ErrorLogin { get; set; }


    }
}
