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
import hust.globalict.entity.sales.CustomerInfo;
import hust.globalict.entity.sys.Account;
import hust.globalict.repository.AccountRepository;
import hust.globalict.repository.CustomerInfoRepository;
import hust.globalict.repository.CustomerRepository;
import hust.globalict.repository.CustomerRevenueRepository;
import hust.globalict.repository.ItemDetailRepository;
import hust.globalict.repository.ProductDetailRepository;

@Controller
public class CustomerController {
	@Autowired
	private CustomerRepository customerRepo;

	@Autowired
	private CustomerRevenueRepository customerReveRepo;

	@Autowired
	private ProductDetailRepository productDetailRepo;

	@Autowired
	private ItemDetailRepository itemDetailRepo;
	
	@Autowired
	private AccountRepository accountRepo;
	
	@Autowired
	private CustomerInfoRepository customerInfoRepo;

	
	public CustomerController(CustomerRevenueRepository customerReveRepo) {
		this.customerReveRepo = customerReveRepo;
	}

	@GetMapping("/customer_revenue")
	public String customerRevenure(Model model) {
		model.addAttribute("customerrevenue", customerReveRepo.viewAll());
		return "customer_revenue";
	}

	@GetMapping("/customer_menu/{id:.+}")
	public String customerMenu(@PathVariable Long id,Model model) {
		model.addAttribute("productdetails", productDetailRepo.viewAllProduct());
		Account account = accountRepo.findAccountById(id);
		model.addAttribute("account",account);
		CustomerInfo customer= customerInfoRepo.findCustomerByAccountId(account.getAccount_id());
		model.addAttribute("customer",customer);
		return "customer_menu";
	}

	@GetMapping("/itemdetails/{product_id:.+}/{customer_id:.+}")
	public String viewAvailableItem(@PathVariable Long product_id,@PathVariable Long customer_id, Model model, RedirectAttributes redirectAttributes) {
		try {
			if (product_id != null) {
				CustomerInfo customer= customerInfoRepo.findCustomerById(customer_id);
				model.addAttribute("customer",customer);
				model.addAttribute("items", itemDetailRepo.viewAllItem(product_id));
				redirectAttributes.addFlashAttribute("message", "Delete successfully: " + product_id);
			} else {
				redirectAttributes.addFlashAttribute("message", "The file does not exist!");
			}
		} catch (Exception e) {
			redirectAttributes.addFlashAttribute("message",
					"Could not delete product with id: " + product_id + ". Error: " + e.getMessage());
		}
		return "itemdetails";
	}

	@GetMapping("/customer_menu/view_top_products/{id:.+}")
	public String viewProductCustomer(@PathVariable Long id,@Param("num") Integer num, Model model) {
		Account account = accountRepo.findAccountById(id);
		model.addAttribute("account",account);
		CustomerInfo customer= customerInfoRepo.findCustomerByAccountId(account.getAccount_id());
		model.addAttribute("customer",customer);

		if (num != null) {
			model.addAttribute("productdetails", productDetailRepo.viewAllProduct());
			model.addAttribute("num", num);
			model.addAttribute("productdetails", productDetailRepo.viewProductsLimit(num));
		} else {
			model.addAttribute("productdetails", productDetailRepo.viewAllProduct());
		}
		return "customer_menu_top";
	}

	@GetMapping("/customer_menu/search_by_name/{id:.+}")
	public String searchProductByNameCustomer(@PathVariable Long id,@Param("name") String name, Model model) {
		Account account = accountRepo.findAccountById(id);
		model.addAttribute("account",account);
		CustomerInfo customer= customerInfoRepo.findCustomerByAccountId(account.getAccount_id());
		model.addAttribute("customer",customer);
		if (name != null) {
			model.addAttribute("productdetails", productDetailRepo.viewAllProduct());
			model.addAttribute("name", name);
			List<ProductDetail> productdetails = productDetailRepo.searchProductByName(name);
			model.addAttribute("productdetails", productdetails);
		} else {
			model.addAttribute("productdetails", productDetailRepo.viewAllProduct());
		}
		return "customer_menu_by_name";
	}

	@GetMapping("/customer_menu/search_by_brand/{id:.+}")
	public String searchProductByBrandCustomer(@PathVariable Long id,@Param("brand") String brand, Model model) {
		Account account = accountRepo.findAccountById(id);
		model.addAttribute("account",account);
		CustomerInfo customer= customerInfoRepo.findCustomerByAccountId(account.getAccount_id());
		model.addAttribute("customer",customer);
		if (brand != null) {
			model.addAttribute("productdetails", productDetailRepo.viewAllProduct());
			model.addAttribute("brand", brand);
			List<ProductDetail> productdetails = productDetailRepo.searchProductByBrand(brand);
			model.addAttribute("productdetails", productdetails);
		} else {
			model.addAttribute("productdetails", productDetailRepo.viewAllProduct());
		}
		return "customer_menu_by_brand";
	}

	@GetMapping("/customer_menu/search_by_category/{id:.+}")
	public String searchProductByCategoryCustomer(@PathVariable Long id,@Param("category") String category, Model model) {
		Account account = accountRepo.findAccountById(id);
		model.addAttribute("account",account);
		CustomerInfo customer= customerInfoRepo.findCustomerByAccountId(account.getAccount_id());
		model.addAttribute("customer",customer); 
		if (category != null) {
			model.addAttribute("productdetails", productDetailRepo.viewAllProduct());
			model.addAttribute("category", category);
			List<ProductDetail> productdetails = productDetailRepo.searchProductByCategory(category);
			model.addAttribute("productdetails", productdetails);
		} else {
			model.addAttribute("productdetails", productDetailRepo.viewAllProduct());
		}
		return "customer_menu_by_category";
	}
	@GetMapping("/customer/update/{id:.+}")
	public String updateCustomerInfo(@PathVariable Long id, Model model, RedirectAttributes redirectAttributes) {
		try {
			if (id != null) {
				CustomerInfo customer= customerInfoRepo.findCustomerByAccountId(id);
				model.addAttribute("customer",customer);
			} else {
				redirectAttributes.addFlashAttribute("message", "The file does not exist!");
			}
		} catch (Exception e) {
			redirectAttributes.addFlashAttribute("message",
					"Could not delete product with id: " + id + ". Error: " + e.getMessage());
		}	
		return "update_customer_info";
	}
	
	@GetMapping("/customer/updating/{id:.+}")
	public String updateProductSub(@PathVariable Long id,@ModelAttribute("customer") CustomerInfo customer,Model model) {
//		CustomerInfo customer= customerInfoRepo.findCustomerById(id);
		model.addAttribute("customer",customer);
		model.addAttribute("first_name", customer.getFirst_name());
		model.addAttribute("last_name", customer.getLast_name());
		model.addAttribute("phone", customer.getPhone());
		model.addAttribute("email", customer.getEmail());
		model.addAttribute("street 	", customer.getStreet());
		model.addAttribute("city", customer.getCity());
		model.addAttribute("user_name", customer.getUser_name());
		model.addAttribute("pass_word", customer.getPass_word());
		
		
		customerInfoRepo.updateCustomerInfo(id,customer.getFirst_name(),customer.getLast_name(),customer.getPhone(),customer.getEmail(),customer.getStreet(),customer.getCity(),customer.getUser_name(),customer.getPass_word());
		
		Account account = accountRepo.findAccountById(customer.getAccount_id());
		model.addAttribute("account",account);
		
		return "redirect:/account/login";
	}

}
