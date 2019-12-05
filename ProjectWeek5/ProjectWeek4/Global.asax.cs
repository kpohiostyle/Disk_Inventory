using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;

namespace ProjectWeek4
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
        }
        protected void Application_Error(object sender, EventArgs e)
        {
            // An error has occured on a .Net page.
            var serverError = Server.GetLastError() as HttpException;

            if (serverError != null)
            {
                if (serverError.GetHttpCode() == 404)
                {
                    Server.ClearError();
                    Server.Transfer("errors.aspx");
                    Response.Status = "404 Not Found";
                    Response.StatusCode = 404;
                    Response.StatusDescription = "Page not found";
                    
                }
            }
        }
    }
}