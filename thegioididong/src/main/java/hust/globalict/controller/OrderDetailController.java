package hust.globalict.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import hust.globalict.repository.OrderDetailRepository;

@Controller
public class OrderDetailController {
	@Autowired
    private OrderDetailRepository orderDetailRepo;
}
