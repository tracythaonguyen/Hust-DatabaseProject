package hust.globalict.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import hust.globalict.entity.products.Brand;
import hust.globalict.entity.products.Category;
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
	@GetMapping("/categories/new")
	public String createCategoryForm(Model model) {
		Category category = new Category();
		model.addAttribute("category", category);
		return "create_category";
	}
	
	@GetMapping("/categories/save")
	public String saveCategory(@ModelAttribute("category") Category category,Model model) {
		model.addAttribute("category_name", category.getCategory_name());
		categoryRepo.addNewCategory(category.getCategory_name());
		model.addAttribute("categories", categoryRepo.listAll());
		return "categories";
	}
}
