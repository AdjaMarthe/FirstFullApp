using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using MyFirstFullStackApp.Business.Interfaces;
using MyFirstFullStackApp.Business.Objects.Test;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace MyFirstFullStackApp.Controllers
{
    [Route("api/[controller]")]
    public class TestController : Controller
    {
        private readonly ITestService _testService;

        public TestController(ITestService testService)
        {
            _testService = testService;
        }


        // GET api/<controller>/5
        [HttpGet("{id}")]
        public async Task<IActionResult> Get(int id)
        {
            var result = await _testService.GetById(id);

            if (result == null)
            {
                return NotFound();
            }
            return Ok(result); 
        }

        // POST api/<controller>
        [HttpPost]
        public async Task<int> Post([FromBody]TestCreateUpdateDTO dto)
        {
            return await _testService.Create(dto);
        }

        // PUT api/<controller>/5
        [HttpPut("{id}")]
        public async Task Update([FromBody]TestCreateUpdateDTO dto)
        {
            await _testService.Update(dto);
        }

        // DELETE api/<controller>/5
        //[HttpDelete("{id}")]
        //public async Task Delete(int id)
        //{
        //    await _testService.Delete(id);
        //}
    }
}
