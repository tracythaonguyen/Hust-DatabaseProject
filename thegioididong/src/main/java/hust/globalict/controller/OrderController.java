package hust.globalict.controller;

import hust.globalict.entity.sales.CustomerInfo;
import hust.globalict.entity.sales.Order;
import hust.globalict.entity.sys.Account;
import hust.globalict.repository.AccountRepository;
import hust.globalict.repository.CustomerInfoRepository;
import hust.globalict.repository.OrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class OrderController {
  @Autowired
  private OrderRepository orderRepo;

  @Autowired
  private AccountRepository accountRepo;

  @Autowired
  private CustomerInfoRepository customerInfoRepo;

  public OrderController(OrderRepository orderRepo) {
    this.orderRepo = orderRepo;
  }

  @GetMapping("/order_history/{id:.+}")
  public String orderHistory(@PathVariable Long id, Model model) {
    Account account = accountRepo.findAccountById(id + 1);
    model.addAttribute("account", account);

    CustomerInfo customer = customerInfoRepo.findCustomerByAccountId(
      account.getAccount_id()
    );
    model.addAttribute("customer", customer);

    Order order = orderRepo.findOrderById(customer.getCustomer_id());
    model.addAttribute("order", order);

    return "order_history";
  }
}
