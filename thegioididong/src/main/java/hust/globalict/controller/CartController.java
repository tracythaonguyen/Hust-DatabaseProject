package hust.globalict.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import hust.globalict.repository.CartRepository;

@Controller
public class CartController {
	@Autowired
    private CartRepository cartRepo;
}
