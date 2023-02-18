package hust.globalict.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import hust.globalict.repository.BrandRepository;

@Controller
public class BrandController {
	@Autowired
    private BrandRepository brandRepo;


	public BrandController(BrandRepository brandRepo) {
		this.brandRepo = brandRepo;
	}
	
	@GetMapping("/brands")
	public String listBrand(Model model){
		model.addAttribute("brands",brandRepo.listAll());
		return "brands";
	}

}
