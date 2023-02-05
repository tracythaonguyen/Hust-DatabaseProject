package hust.globalict.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import hust.globalict.repository.CoverageRepository;

@Controller
public class CoverageController {
	@Autowired
    private CoverageRepository coverageRepo;
}