package hust.globalict.controller;

import hust.globalict.repository.StockRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class StockController {
  @Autowired
  private StockRepository stockRepo;

  @GetMapping("/stock")
  public String listProduct(Model model) {
    model.addAttribute("products", stockRepo.viewAll());
    return "stock";
  }
}
