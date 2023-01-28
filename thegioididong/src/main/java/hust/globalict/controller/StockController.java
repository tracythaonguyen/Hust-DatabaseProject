package hust.globalict.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import hust.globalict.repository.StockRepository;

@Controller
public class StockController {
	@Autowired
    private StockRepository stockRepo;
}