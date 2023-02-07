package hust.globalict.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import hust.globalict.repository.ConfigRepository;

@Controller
public class ConfigController {
	@Autowired
    private ConfigRepository configRepo;
}
