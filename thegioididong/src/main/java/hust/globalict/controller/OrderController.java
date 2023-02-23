package hust.globalict.controller;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

import hust.globalict.entity.sales.CustomerInfo;
import hust.globalict.entity.sales.OrderHistory;
import hust.globalict.repository.AccountRepository;
import hust.globalict.repository.CustomerInfoRepository;
import hust.globalict.repository.CustomerRepository;
import hust.globalict.repository.ItemRepository;
import hust.globalict.repository.OrderHistoryDetailRepository;
import hust.globalict.repository.OrderHistoryRepository;
import hust.globalict.repository.OrderRepository;

@Controller
public class OrderController {
	@Autowired
	private OrderRepository orderRepo;

	@Autowired
	private AccountRepository accountRepo;

	@Autowired
	private CustomerInfoRepository customerInfoRepo;

	@Autowired
	private OrderHistoryRepository orderHisRepo;

	@Autowired
	OrderHistoryDetailRepository orderHisDeRepo;

	@Autowired
	ItemRepository itemRepo;

	@Autowired
	CustomerRepository customerRepo;

	public OrderController(OrderRepository orderRepo) {
		this.orderRepo = orderRepo;
	}

	@GetMapping("/order_history/{id:.+}")
	public String orderHistory(@PathVariable Long id, Model model) {
		CustomerInfo customer = customerInfoRepo.findCustomerById(id);
		model.addAttribute("customer", customer);

		List<OrderHistory> orders = orderHisRepo.viewOrderDetailById(id);
		model.addAttribute("orders", orders);

		return "order_history";
	}

	@GetMapping("/order_history/detail/{customer_id:.+}/{order_id:.+}")
	public String orderDetail(@PathVariable Long customer_id, @PathVariable Long order_id, Model model) {
		CustomerInfo customer = customerInfoRepo.findCustomerById(customer_id);
		model.addAttribute("customer", customer);
		model.addAttribute("orderdetails", orderHisDeRepo.viewDetailOrderHistory(customer_id, order_id));
		return "order_detail";

	}

	@GetMapping("/cancelorder/{customer_id:.+}/{order_id:.+}")
	public String CancelOrder(@PathVariable Long customer_id, @PathVariable Long order_id, Model model) {
		CustomerInfo customer = customerInfoRepo.findCustomerById(customer_id);
		model.addAttribute("customer", customer);
		orderRepo.cancelOrder(customer_id, order_id);
		List<OrderHistory> orders = orderHisRepo.viewOrderDetailById(customer_id);
		model.addAttribute("orders", orders);
		return "order_history";

	}

	@GetMapping("/search_order_by_date/{customer_id:.+}")
	public String viewProduct(@PathVariable Long customer_id, @Param("order_date") Date order_date, Model model) {
		if (order_date != null) {
			model.addAttribute("order_date", order_date);
			CustomerInfo customer = customerInfoRepo.findCustomerById(customer_id);
			model.addAttribute("customer", customer);

			List<OrderHistory> orders = orderHisRepo.searchOrderByDate(customer_id, order_date);
			model.addAttribute("orders", orders);
		} else {
			CustomerInfo customer = customerInfoRepo.findCustomerById(customer_id);
			model.addAttribute("customer", customer);

			List<OrderHistory> orders = orderHisRepo.viewOrderDetailById(customer_id);
			model.addAttribute("orders", orders);
		}
		return "order_history_by_date";
	}

	@GetMapping("/rate_product/{serial_code:.+}/{customer_id:.+}")
	public String rateProduct(@PathVariable String serial_code, @PathVariable Long customer_id,
			@Param("score") BigDecimal score, Model model) {
		CustomerInfo customer = customerInfoRepo.findCustomerById(customer_id);
		model.addAttribute("customer", customer);
		model.addAttribute("customer_id", customer_id);
		model.addAttribute("product_id", itemRepo.getProductIdBySerialCode(serial_code));
		model.addAttribute("score", score);
		return "rate_product";

	}

	@GetMapping("/rate_success/{product_id:.+}/{customer_id:.+}")
	public String rateProductSuccess(@PathVariable Long product_id,@PathVariable Long  customer_id,@ModelAttribute("score") BigDecimal score, Model model) {
		model.addAttribute("score", score);
		model.addAttribute("customer_id", customer_id);
		CustomerInfo customer = customerInfoRepo.findCustomerById(customer_id);
		model.addAttribute("customer", customer);
		model.addAttribute("product_id", product_id);
		List<OrderHistory> orders = orderHisRepo.viewOrderDetailById(customer_id);
		model.addAttribute("orders", orders);

		customerRepo.rateProduct(customer_id,product_id,score);
		return "order_history";

	}
}
