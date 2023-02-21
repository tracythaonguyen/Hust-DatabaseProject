package hust.globalict.controller;

import hust.globalict.repository.ProductRevenueRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ProductController {
  @Autowired
  private ProductRevenueRepository productReveRepo;

  public ProductController(ProductRevenueRepository productRevenueRepo) {
    this.productReveRepo = productReveRepo;
  }

  @GetMapping("/product_revenue")
  public String productRevenure(Model model) {
    model.addAttribute("productrevenue", productReveRepo.viewAll());
    return "product_revenue";
  }
}
