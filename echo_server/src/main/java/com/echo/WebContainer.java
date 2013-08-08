package com.echo;

import org.eclipse.jetty.server.Connector;
import org.eclipse.jetty.server.Handler;
import org.eclipse.jetty.server.Server;
import org.eclipse.jetty.server.ServerConnector;
import org.eclipse.jetty.server.handler.HandlerList;
import org.eclipse.jetty.servlet.ServletHandler;

/**
 * Hello world!
 *
 */
public class WebContainer 
{
	public static void main(String[] args) throws Exception {
		Server server = new Server(8080);
		
		ServerConnector http = new ServerConnector(server);
		http.setPort(8080);
		http.setIdleTimeout(30000);
		server.setConnectors(new Connector[] { http });
		
		// create servlet handlers
		ServletHandler servlet_handler = new ServletHandler();		
		
		HandlerList handlers = new HandlerList();
		handlers.setHandlers(new Handler[] { servlet_handler });
		server.setHandler(handlers);
		
		servlet_handler.addServletWithMapping(HelloServlet.class, "/HelloWorld");
		
		server.start();
		server.join();
	}
}
