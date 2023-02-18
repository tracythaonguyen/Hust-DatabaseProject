package hust.globalict.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import hust.globalict.repository.BrandRepository;
import hust.globalict.repository.CategoryRepository;

@Controller
public class CategoryController {
	@Autowired
	private CategoryRepository categoryRepo;

	public CategoryController(CategoryRepository categoryRepo) {
		this.categoryRepo = categoryRepo;
	}

	@GetMapping("/categories")
	public String listCategoryrand(Model model) {
		model.addAttribute("categories", categoryRepo.listAll());
		return "categories";
	}
}
