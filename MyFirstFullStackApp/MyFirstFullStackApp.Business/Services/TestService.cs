using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using MyFirstFullStackApp.Business.Interfaces;
using MyFirstFullStackApp.Business.Objects.Test;
using MyFirstFullStackApp.DAL;
using MyFirstFullStackApp.DAL.Models;

namespace MyFirstFullStackApp.Business.Services
{
    public class TestService : ITestService
    {

        private readonly MyFirstFullStackAppContext _firstContext;

        public TestService(MyFirstFullStackAppContext firstContext)
        {
            _firstContext = firstContext;
        }

        public async Task<int> Create(TestCreateUpdateDTO test)
        {
            var testCreate = new Test
            {
                Title = test.Title
            };

            _firstContext.Test.Add(testCreate);
            await _firstContext.SaveChangesAsync();

            return testCreate.Id;
        }

        public async Task Delete(int id)
        {
            // Code à venir

            await _firstContext.SaveChangesAsync();
        }

        public async Task<TestDTO> GetById(int id)
        {
            return await _firstContext.Test
               .Where(t => t.Id == id)
               .Select(tst => new TestDTO
               {
                   Id = tst.Id,
                   Title = tst.Title
               })
               .FirstOrDefaultAsync();
        }

        public async Task Update(TestCreateUpdateDTO test)
        {
            var testUpdate = await _firstContext.Test.FirstAsync(c => c.Id == test.Id);

            testUpdate.Title = test.Title;
            await _firstContext.SaveChangesAsync();
        }
    }
}
