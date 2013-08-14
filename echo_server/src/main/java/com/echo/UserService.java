package com.echo;

import java.util.LinkedList;

import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.Consumes;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

@Path("/users")
public class UserService {
	private LinkedList<UserTemplate> usersList = new LinkedList<UserTemplate>();
	
   // @PUT
   // @Consumes(MediaType.APPLICATION_JSON)
   /*public Response create(UserTemplate user) {
	   String result = "receive Json request:" + user.toString();
	   System.out.println(result);
	   return Response.status(201).build();
   }*/
	   
	   
	   

}
