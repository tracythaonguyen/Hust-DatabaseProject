package hust.globalict.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import hust.globalict.repository.OrderRepository;

@Controller
public class OrderController {
	@Autowired
    private OrderRepository orderRepo;
}