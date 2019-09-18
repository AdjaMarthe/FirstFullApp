using System;
using System.Collections.Generic;
using System.Text;
using Microsoft.EntityFrameworkCore;
using MyFirstFullStackApp.DAL.Models;

namespace MyFirstFullStackApp.DAL
{
    public class MyFirstFullStackAppContext : DbContext
    {
        public MyFirstFullStackAppContext(DbContextOptions<MyFirstFullStackAppContext> options)
            : base(options)
        {
        }

        // Tables
        public DbSet<Test> Test { get; set; }
        public DbSet<Candidate> Candidate { get; set; }
    }
}
