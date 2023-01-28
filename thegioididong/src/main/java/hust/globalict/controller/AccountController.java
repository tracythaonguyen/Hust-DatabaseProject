package hust.globalict.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import hust.globalict.repository.AccountRepository;

@Controller
public class AccountController {
	@Autowired
    private AccountRepository accountsRepo;
}
