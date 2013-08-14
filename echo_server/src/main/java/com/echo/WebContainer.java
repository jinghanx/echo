package com.echo;

import org.eclipse.jetty.server.Connector;
import org.eclipse.jetty.server.Server;
import org.eclipse.jetty.server.ServerConnector;
import org.eclipse.jetty.server.handler.HandlerList;
import org.eclipse.jetty.servlet.ServletContextHandler;
import org.eclipse.jetty.servlet.ServletHandler;
import org.eclipse.jetty.servlet.ServletHolder;
import org.eclipse.jetty.server.Handler;

import com.sun.jersey.api.core.PackagesResourceConfig;
import com.sun.jersey.spi.container.servlet.ServletContainer;

public class WebContainer 
{
	public static void main(String[] args) throws Exception {
		Server server = new Server(8080);
		
		ServerConnector http = new ServerConnector(server);
		http.setPort(8080);
		http.setIdleTimeout(30000);
		server.setConnectors(new Connector[] { http });
		
		// create servlet handlers
        ServletHolder servletHolder = new ServletHolder(ServletContainer.class);
        
        servletHolder.setInitParameter("com.sun.jersey.config.property.resourceConfigClass", PackagesResourceConfig.class.getCanonicalName());
        // IMPORTANT: you have to specify the package where your resources are located in order for Jetty to pick them up
        servletHolder.setInitParameter("com.sun.jersey.config.property.packages", "com.echo");

        ServletContextHandler context = new ServletContextHandler(ServletContextHandler.SESSIONS);
        context.setContextPath("/");
        context.addServlet(servletHolder, "/*");

        ServletHandler servletHandler = new ServletHandler();
        
        HandlerList handlers = new HandlerList();
        handlers.setHandlers(new Handler[] { servletHandler,context });
        server.setHandler(handlers);
        
        servletHandler.addServletWithMapping("com.echo.HelloWorldServlet", "/hello");
		
		server.start();
		server.join();
	}
}
