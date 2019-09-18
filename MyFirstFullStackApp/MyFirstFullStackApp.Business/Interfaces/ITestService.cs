using System;
using System.Collections.Generic;
using System.Text;
using MyFirstFullStackApp.Business.Objects.Test;
using System.Threading.Tasks;

namespace MyFirstFullStackApp.Business.Interfaces
{
    public interface ITestService
    {
        Task<int> Create(TestCreateUpdateDTO test);
        Task<TestDTO> GetById(int id);
        Task Update(TestCreateUpdateDTO test);
        Task Delete(int id);
    }
}
