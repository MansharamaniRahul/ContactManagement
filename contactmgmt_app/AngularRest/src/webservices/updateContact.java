package webservices;

import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;

import java.sql.*;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.GenericEntity;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.codehaus.jettison.json.JSONObject;

import java.util.*;

import entities.Product;

import DAO.*;
@Path("/update")
public class updateContact {

	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public Response update(String  contactDetails) throws Exception
	{		
		CRUDOperations crudOperations=new CRUDOperations();
		ArrayList<Product> contacts=new ArrayList<Product>();
		
		//Delete Contact
		contacts=crudOperations.updateContact(contactDetails);
		
		return Response.ok().entity(new GenericEntity<List<Product>>(contacts){}).header("Access-Control-Allow-Origin", "*")
				.header("Access-Control-Allow-Methods", "GET,POST,DELETE,PUT,OPTIONS,HEAD").build();
	}
}