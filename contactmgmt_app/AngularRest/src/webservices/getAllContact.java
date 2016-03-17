package webservices;


import javax.ws.rs.GET;
import java.sql.*;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.GenericEntity;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.util.*;
import entities.*;
import entities.Product;
import DAO.*;

@Path("/get")
public class getAllContact {
	@GET	
	@Produces(MediaType.APPLICATION_JSON)
	public Response get() throws Exception
	{		
		
		CRUDOperations crudOperations=new CRUDOperations();
		ArrayList<Product> contacts=new ArrayList<Product>();
		
		//Get All Contact
		contacts=crudOperations.getContactsFromDB();
		return Response.ok().entity(new GenericEntity<List<Product>>(contacts){}).header("Access-Control-Allow-Origin", "*")
				.header("Access-Control-Allow-Methods", "GET,POST,DELETE,PUT,OPTIONS,HEAD").build();
	}
	
}
