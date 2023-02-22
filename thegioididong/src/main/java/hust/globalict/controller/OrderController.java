package hust.globalict.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import hust.globalict.entity.sales.CustomerInfo;
import hust.globalict.entity.sales.OrderHistory;
import hust.globalict.repository.AccountRepository;
import hust.globalict.repository.CustomerInfoRepository;
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
  public String orderDetail(@PathVariable Long customer_id,@PathVariable Long order_id, Model model) {
	    CustomerInfo customer = customerInfoRepo.findCustomerById(customer_id);
	    model.addAttribute("customer", customer);
	    model.addAttribute("orderdetails", orderHisDeRepo.viewDetailOrderHistory(customer_id,order_id));
    return "order_detail";
  
  }
  
  
  @GetMapping("/cancelorder/{customer_id:.+}/{order_id:.+}")
  public String CancelOrder(@PathVariable Long customer_id,@PathVariable Long order_id, Model model) {
	    CustomerInfo customer = customerInfoRepo.findCustomerById(customer_id);
	    model.addAttribute("customer", customer);
	    orderRepo.cancelOrder(customer_id,order_id);
	    List<OrderHistory> orders = orderHisRepo.viewOrderDetailById(customer_id);
	    model.addAttribute("orders", orders);
  return "order_history";

}
}

