package hust.globalict.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import hust.globalict.entity.products.ProductDetail;
import hust.globalict.repository.ItemDetailRepository;
import hust.globalict.repository.ProductDetailRepository;
import hust.globalict.repository.ProductRepository;

@Controller
public class ProductDetailController {
	@Autowired
	private ProductDetailRepository productDetailRepo;

	@Autowired
	private ProductRepository productRepo;

	@Autowired
	private ItemDetailRepository itemDetailRepo;

	public ProductDetailController(ProductDetailRepository productRepo) {
		this.productDetailRepo = productDetailRepo;
	}

	@GetMapping("/productdetails")
	public String listProductMenu(Model model) {
		model.addAttribute("productdetails", productDetailRepo.viewAllProduct());
		return "productdetailsoptionmenu";
	}

	@GetMapping("/productdetails/view_top_products")
	public String viewProduct(@Param("num") Integer num, Model model) {
		if (num != null) {
			model.addAttribute("num", num);
			model.addAttribute("productdetails", productDetailRepo.viewProductsLimit(num));
		} else {
			model.addAttribute("productdetails", productDetailRepo.viewAllProduct());
		}
		return "productdetails";
	}

	@GetMapping("/productdetails/search_by_name")
	public String searchProductByName(@Param("name") String name, Model model) {
		if (name != null) {
			model.addAttribute("name", name);
			List<ProductDetail> productdetails = productDetailRepo.searchProductByName(name);
			model.addAttribute("productdetails", productdetails);
		} else {
			model.addAttribute("productdetails", productDetailRepo.viewAllProduct());
		}
		return "Search_product_by_name";
	}

	@GetMapping("/productdetails/search_by_brand")
	public String searchProductByBrand(@Param("brand") String brand, Model model) {
		if (brand != null) {
			model.addAttribute("brand", brand);
			List<ProductDetail> productdetails = productDetailRepo.searchProductByBrand(brand);
			model.addAttribute("productdetails", productdetails);
		} else {
			model.addAttribute("productdetails", productDetailRepo.viewAllProduct());
		}
		return "Search_product_by_brand";
	}

	@GetMapping("/productdetails/search_by_category")
	public String searchProductByCategory(@Param("category") String category, Model model) {
		if (category != null) {
			model.addAttribute("category", category);
			List<ProductDetail> productdetails = productDetailRepo.searchProductByCategory(category);
			model.addAttribute("productdetails", productdetails);
		} else {
			model.addAttribute("productdetails", productDetailRepo.viewAllProduct());
		}
		return "Search_product_by_category";
	}

	@GetMapping("/discontinueProduct/{id:.+}")
	public String discontinueProduct(@PathVariable Long id, Model model, RedirectAttributes redirectAttributes) {
		try {
			if (id != null) {
				productRepo.discontinueProductById(id);
				redirectAttributes.addFlashAttribute("message", "Delete successfully: " + id);
			} else {
				redirectAttributes.addFlashAttribute("message", "The file does not exist!");
			}
		} catch (Exception e) {
			redirectAttributes.addFlashAttribute("message",
					"Could not delete product with id: " + id + ". Error: " + e.getMessage());
		}
		return "redirect:/productdetails";
	}
	@GetMapping("/productdetails/new")
	public String createProductForm(Model model) {
		ProductDetail product= new ProductDetail();
		model.addAttribute("product", product);
		return "create_product";
	}
	
	@GetMapping("/productdetails/save")
	public String saveProduct(@ModelAttribute("product") ProductDetail product,Model model) {
		model.addAttribute("product_name", product.getProduct_name());
		model.addAttribute("brand_name", product.getBrand_name());
		model.addAttribute("category_name", product.getCategory_name());
		model.addAttribute("model_year", product.getModel_year());
		model.addAttribute("list_price", product.getList_price());
		
		productDetailRepo.addProduct(product.getProduct_name(),product.getBrand_name(),product.getCategory_name(),product.getModel_year(),product.getList_price());
		model.addAttribute("productdetails", productDetailRepo.viewAllProduct());
		return "productdetailsoptionmenu";
	}
	@GetMapping("/productdetails/update/{id:.+}")
	public String updateProduct(@PathVariable Long id, Model model, RedirectAttributes redirectAttributes) {
		try {
			if (id != null) {
				ProductDetail product= productDetailRepo.searchProductById(id);
				model.addAttribute("product", product);
			} else {
				redirectAttributes.addFlashAttribute("message", "The file does not exist!");
			}
		} catch (Exception e) {
			redirectAttributes.addFlashAttribute("message",
					"Could not delete product with id: " + id + ". Error: " + e.getMessage());
		}	
		return "update_product";
	}
	@GetMapping("/productdetails/updating/{id:.+}")
	public String updateProductSub(@PathVariable Long id,@ModelAttribute("product") ProductDetail product,Model model) {
		model.addAttribute("product_name", product.getProduct_name());
		model.addAttribute("brand_name", product.getBrand_name());
		model.addAttribute("category_name", product.getCategory_name());
		model.addAttribute("model_year", product.getModel_year());
		model.addAttribute("list_price", product.getList_price());
		productDetailRepo.updateProduct(id,product.getProduct_name(),product.getBrand_name(),product.getCategory_name(),product.getModel_year(),product.getList_price());

		model.addAttribute("productdetails", productDetailRepo.viewAllProduct());
		productDetailRepo.updateProduct(product.getProduct_id(),product.getProduct_name(),product.getBrand_name(),product.getCategory_name(),product.getModel_year(),product.getList_price());

		return "productdetailsoptionmenu";
	}
	
}
