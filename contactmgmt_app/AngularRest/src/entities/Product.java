package entities;


import java.io.*;
import javax.xml.bind.annotation.*;

@XmlRootElement(name = "product")
public class Product implements Serializable{

	private String fname;
	private String lname;
	private Integer id;
	private int phn;
	
	@XmlElement
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	@XmlElement
	public String getLname() {
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}
	@XmlElement
	public int getId() {
		return id;
	}
	public void setId(Integer integer) {
		this.id = integer;
	}
	@XmlElement
	public int getPhn() {
		return phn;
	}
	public void setPhn(int phn) {
		this.phn = phn;
	}
	public Product(String fname, String lname, int id, int phn) {
		super();
		this.fname = fname;
		this.lname = lname;
		this.id = id;
		this.phn = phn;
	}
	public Product() {
		super();
	}
	
}
	
	
	
	
	
	
	
	
	