﻿using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(ProjectWeek4.Startup))]
namespace ProjectWeek4
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
