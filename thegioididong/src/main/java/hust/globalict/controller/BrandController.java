package hust.globalict.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import hust.globalict.entity.products.Brand;
import hust.globalict.repository.BrandRepository;

@Controller
public class BrandController {
	@Autowired
	private BrandRepository brandRepo;

	public BrandController(BrandRepository brandRepo) {
		this.brandRepo = brandRepo;
	}

	@GetMapping("/brands")
	public String listBrand(Model model) {
		model.addAttribute("brands", brandRepo.listAll());
		return "brands";
	}

	@GetMapping("/brands/new")
	public String createBrandForm(Model model) {
		Brand brand = new Brand();
		model.addAttribute("brand", brand);
		return "create_brand";
	}
	
	@GetMapping("/brands/save")
	public String saveBrand(@ModelAttribute("brand") Brand brand,Model model) {
		model.addAttribute("brand_name", brand.getBrand_name());
		brandRepo.addNewBrand(brand.getBrand_name());
		model.addAttribute("brands", brandRepo.listAll());
		return "brands";
	}
}
