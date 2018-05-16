using asp.net_core_mvc;
using FluentAssertions;
using Microsoft.AspNetCore;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.TestHost;
using System;
using System.Threading.Tasks;
using Xunit;

namespace test_project
{
    public class HomeControllerTests
    {
        [Fact]
        public async Task Get_index_test_should_return_html()
        {
            var server = new TestServer(WebHost.CreateDefaultBuilder().UseStartup<Startup>());
            var httpClient = server.CreateClient();

            var response = await httpClient.GetAsync("/Home/Test");
            response.IsSuccessStatusCode.Should().BeTrue();
        }
    }
}
