using System;
using System.Collections.Generic;
using System.Text;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace MyFirstFullStackApp.DAL.Models
{
    [Table("Candidate")]
    public class Candidate
    {
        [Key]
        public int Id { get; set; }
        [ForeignKey("TestId")]
        public int TestId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
    }
}
