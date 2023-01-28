package hust.globalict.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import hust.globalict.repository.ProductRepository;

@Controller
public class ProductController {
	@Autowired
    private ProductRepository productRepo;
}
