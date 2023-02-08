package hust.globalict.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import hust.globalict.repository.ProductRepository;

@Controller
public class ProductController {
	@Autowired
    private ProductRepository productRepo;

	public ProductController(ProductRepository productRepo) {
		this.productRepo = productRepo;
	}
	
	@GetMapping("/products/listall")
	public String listBrand(Model model){
		model.addAttribute("products",productRepo.viewAllProduct());
		return "products";
	}
}
