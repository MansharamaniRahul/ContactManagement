package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import org.bson.Document;
import org.bson.types.ObjectId;
import org.codehaus.jettison.json.JSONObject;

import com.mongodb.MongoClient;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoDatabase;
import com.sun.research.ws.wadl.Doc;

import entities.Product;

public class CRUDOperations {

	private MongoDatabase getConnectioToDb(){
		MongoClient cl=new MongoClient();
		MongoDatabase db=cl.getDatabase("contactList");
		return db;
	}
	

	//Execute Query
	private ArrayList<Product> getDBData() throws Exception{
		ResultSet rs=null;
		ArrayList<Product> contacts=new ArrayList<Product>();
		MongoDatabase db = getConnectioToDb();		 
		try{			
			if(db!=null)
			{
					FindIterable<Document> iterable=db.getCollection("contactList").find(); 
					for (Document current : iterable) {
						Product p =new Product();
						p.setFname(current.getString("fName"));
						p.setLname(current.getString("lName"));						
						p.setPhn(current.getInteger("phnNumber"));
						//ObjectId id =(ObjectId)current.get( "_id" );
						p.setId(current.getInteger("id"));
						contacts.add(p);	
						p=null;
						}					
					
			}	
		}
		catch(Exception e){
			
		}finally{
		
		}
		return contacts;
	}			

	//Add Contact to Db
	public ArrayList<Product> addContacttoDB(String contactDetails) throws Exception {
		ArrayList<Product> contacts=new ArrayList<Product>();
		JSONObject obj=new JSONObject(contactDetails);		
		String fname=obj.getString("fname");
		String lname=obj.getString("lname");		
		int phoneNumber=obj.getInt("phn");											
		int id=obj.getInt("id");
		MongoDatabase db = getConnectioToDb();
		
		db.getCollection("contactList")
		.insertOne(new Document("fName",fname)
			.append("lName", lname)
			.append("phnNumber", phoneNumber)
			.append("id", id));
		
		return getDBData();
	}

	// Read Operations
	public ArrayList<Product> getContactsFromDB() throws Exception {			
		return getDBData();			
	}

	//Update Contact
	public ArrayList<Product> updateContact(String contactDetails) throws Exception{
		JSONObject obj=new JSONObject(contactDetails);		
		String fname=obj.getString("fname");
		String lname=obj.getString("lname");
		int id=obj.getInt("id");
		int phoneNumber=obj.getInt("phn");
        MongoDatabase db = getConnectioToDb();
		
		db.getCollection("contactList")
		.updateOne(new Document("id",id), new Document("$set",new Document("fName",fname)
		.append("lName",lname)
		.append("phoneNumber", phoneNumber)));
		return getDBData();
	}

	public ArrayList<Product> deleteContact(Long id) throws Exception{				
		String deleteQuery= "delete from connection where id="+id;
		MongoDatabase db = getConnectioToDb();
		
		db.getCollection("contactList")
		.deleteOne(new Document("id",id));
		return getDBData();
	}

}
