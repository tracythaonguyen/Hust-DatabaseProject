package hust.globalict.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import hust.globalict.repository.RoleRepository;

@Controller
public class RoleController {
	@Autowired
    private RoleRepository roleRepo;
}