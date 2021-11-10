package model;

import java.io.Serializable;

public class Product implements Serializable {

	private static final long serialVersionUID = 8L;
	private int id;
	private String name;
	private Category category;
	//private Brand brand;
	private double price;
	private String details;
	
	public Product() {
		super();
	}
	public Product(int id, String name, Category category, double price, String details) {
		super();
		this.id = id;
		this.name = name;
		this.category = category;
		this.price = price;
		this.details = details;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}

	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getDetails() {
		return details;
	}
	public void setDetails(String details) {
		this.details = details;
	}
	@Override
	public String toString() {
		return "Product [id=" + id + ", name=" + name + ", category=" + category + ", price="
				+ price + ", details=" + details + "]";
	}
	
	
}
