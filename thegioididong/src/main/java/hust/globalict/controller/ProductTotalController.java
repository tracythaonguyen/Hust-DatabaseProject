package hust.globalict.controller;

import hust.globalict.repository.ProductTotalRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ProductTotalController {
  @Autowired
  private ProductTotalRepository productTotalRepo;

  public ProductTotalController(ProductTotalRepository productTotalRepo) {
    this.productTotalRepo = productTotalRepo;
  }

  @GetMapping("/product_total")
  public String productTotal(Model model) {
    model.addAttribute("producttotal", productTotalRepo.viewAll());
    return "product_total_sold";
  }
}
