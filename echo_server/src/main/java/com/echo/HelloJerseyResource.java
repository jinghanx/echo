package com.echo;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;

@Path("/hellojersey")
public class HelloJerseyResource {
	
	@GET
	@Produces("text/plain")
	public String getClichedMessage() {
		return "Hello jersey from ourUnix!";
	}
}
