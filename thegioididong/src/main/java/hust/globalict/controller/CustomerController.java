package hust.globalict.controller;

import hust.globalict.repository.CustomerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CustomerController {
  @Autowired
  private CustomerRepository customerRepo;

  public CustomerController(CustomerRepository customerRepo) {
    this.customerRepo = customerRepo;
  }
}
