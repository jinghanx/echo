package com.echo.prototype;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.LinkedList;

import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;

@Path("/users")
public class UserService {
	private static LinkedList<UserTemplate> usersList = new LinkedList<UserTemplate>();
	
    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    public Response addNewUser(UserTemplate user) {
	   String result = "receive Json request:" + user.toString();
	   System.out.println(result);
	   usersList.add(user);
	   return Response.status(201).build();
   }
	   
    
    /*	
     * return usersList in text/html format example
    @Path("/list")
    @GET
    @Produces("text/html")
    public String listAllUsers() {
    	StringBuilder responseSb = new StringBuilder();
    	
    	for (int i = 0; i < usersList.size(); i++) {
    		responseSb.append("<h1>");
    		responseSb.append(usersList.get(i).getName().toString());
    		responseSb.append("</h1>");
    	}
    	
    	String result = responseSb.toString();
    	System.out.println(result);
    	return result;
    }
    */
	
    @Path("/list")
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public String getUsersList() {
    	final OutputStream out = new ByteArrayOutputStream();
        final ObjectMapper mapper = new ObjectMapper();

        try {
			mapper.writeValue(out, usersList);
		} catch (JsonGenerationException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
    		
        String usersListJSON = out.toString();
        System.out.println(new String(usersListJSON));
        
    	return usersListJSON;
    }
}
