package hust.globalict.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import hust.globalict.repository.CustomerRepository;

@Controller
public class CustomerController {
	@Autowired
    private CustomerRepository customerRepo;
}
