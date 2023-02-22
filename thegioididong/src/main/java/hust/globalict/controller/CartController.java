package hust.globalict.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import hust.globalict.entity.sales.CustomerInfo;
import hust.globalict.repository.CartDetailRepository;
import hust.globalict.repository.CartRepository;
import hust.globalict.repository.CustomerInfoRepository;
import hust.globalict.repository.ItemDetailRepository;
import hust.globalict.repository.ProductDetailRepository;

@Controller
public class CartController {
	@Autowired
	private CartRepository cartRepo;
	
	@Autowired
	private CartDetailRepository cartDetailRepo;	

	@Autowired
	private CustomerInfoRepository customerInfoRepo;

	@Autowired
	private ProductDetailRepository productDetailRepo;
	
	@Autowired
	private ItemDetailRepository itemDetailRepo;

	@GetMapping("/customer/cart/{id:.+}")
	public String customerCart(@PathVariable Long id, Model model) {
		CustomerInfo customer = customerInfoRepo.findCustomerById(id);
		model.addAttribute("customer", customer);
		model.addAttribute("cartdetails", cartDetailRepo.viewCart(id));
		return "cart";
	}

	@GetMapping("/customer/add_cart/{product_id:.+}/{serial_code:.+}/{customer_id:.+}")
	public String addCart(@PathVariable Long product_id, @PathVariable String serial_code,
			@PathVariable Long customer_id, Model model, RedirectAttributes redirectAttributes) {
		try {
			if (serial_code != null) {
				CustomerInfo customer = customerInfoRepo.findCustomerById(customer_id);
				model.addAttribute("customer", customer);
				model.addAttribute("serial_code", serial_code);
				cartRepo.addToCart(customer_id, serial_code);
				model.addAttribute("items", itemDetailRepo.viewAllItem(product_id));
				redirectAttributes.addFlashAttribute("message", "Delete successfully: " + serial_code);
			} else {
				redirectAttributes.addFlashAttribute("message", "The file does not exist!");
			}
		} catch (Exception e) {
			redirectAttributes.addFlashAttribute("message",
					"Could not delete product with id: " + serial_code + ". Error: " + e.getMessage());
		}
		return "itemdetails";
	}
	
	@GetMapping("/deletefromcart/{customer_id:.+}/{serial_code:.+}")
	public String deleteFromCart(@PathVariable Long customer_id, @PathVariable String serial_code, Model model, RedirectAttributes redirectAttributes) {
		try {
			if (serial_code != null) {
				CustomerInfo customer = customerInfoRepo.findCustomerById(customer_id);
				model.addAttribute("customer", customer);
				model.addAttribute("serial_code", serial_code);
				cartRepo.deleteFromCart(customer_id, serial_code);
				model.addAttribute("cartdetails", cartDetailRepo.viewCart(customer_id));
				redirectAttributes.addFlashAttribute("message", "Delete successfully: " + serial_code);
			} else {
				redirectAttributes.addFlashAttribute("message", "The file does not exist!");
			}
		} catch (Exception e) {
			redirectAttributes.addFlashAttribute("message",
					"Could not delete product with id: " + serial_code + ". Error: " + e.getMessage());
		}
		return "cart";
	}
	
	@GetMapping("/makeorder/{id:.+}")
	public String makeOrder(@PathVariable Long id, Model model) {
		CustomerInfo customer = customerInfoRepo.findCustomerById(id);
		model.addAttribute("customer", customer);
		return "cart";
	}
}
