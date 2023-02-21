package hust.globalict.controller;

import hust.globalict.repository.CustomerRepository;
import hust.globalict.repository.CustomerRevenueRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CustomerController {
  @Autowired
  private CustomerRepository customerRepo;

  @Autowired
  private CustomerRevenueRepository customerReveRepo;

  public CustomerController(CustomerRevenueRepository customerReveRepo) {
    this.customerReveRepo = customerReveRepo;
  }

  @GetMapping("/customer_revenue")
  public String customerRevenure(Model model) {
    model.addAttribute("customerrevenue", customerReveRepo.viewAll());
    return "customer_revenue";
  }
}
