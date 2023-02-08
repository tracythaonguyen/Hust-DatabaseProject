package hust.globalict.repository;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import hust.globalict.entity.products.Brand;
import hust.globalict.entity.products.Category;

public class ProductDetail {
	private long product_id;
	
	private String product_name;
	
	private String brand_name;
	
	private String category_name;
	
	private String model_year;
	
	private int list_price;
	
	private int avg_rating;
	
	private int total_review;
}
