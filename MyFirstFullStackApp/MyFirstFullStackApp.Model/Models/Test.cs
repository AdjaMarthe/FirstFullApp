using System;
using System.Collections.Generic;
using System.Text;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace MyFirstFullStackApp.DAL.Models
{
    [Table("Test")]
    public class Test
    {
        [Key]
        public int Id { get; set; }
        public string Title { get; set; }
    }
}
