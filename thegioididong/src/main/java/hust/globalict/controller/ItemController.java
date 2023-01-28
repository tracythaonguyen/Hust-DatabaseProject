package hust.globalict.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import hust.globalict.repository.ItemRepository;

@Controller
public class ItemController {
	@Autowired
    private ItemRepository itemRepo;
}