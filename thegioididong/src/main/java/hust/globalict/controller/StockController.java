package hust.globalict.controller;

import hust.globalict.entity.products.Stock;
import hust.globalict.repository.StockRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class StockController {
  @Autowired
  private StockRepository stockRepo;

  @GetMapping("/stock")
  public String listProduct(Model model) {
    model.addAttribute("products", stockRepo.viewAll());
    return "stock";
  }

  @GetMapping("/stock/update/{id:.+}")
  public String updateProduct(
    @PathVariable Long id,
    Model model,
    RedirectAttributes redirectAttributes
  ) {
    try {
      if (id != null) {
        Stock product = stockRepo.searchProductById(id);
        model.addAttribute("product", product);
      } else {
        redirectAttributes.addFlashAttribute(
          "message",
          "The file does not exist!"
        );
      }
    } catch (Exception e) {
      redirectAttributes.addFlashAttribute(
        "message",
        "Could not delete product with id: " + id + ". Error: " + e.getMessage()
      );
    }
    return "update_stock";
  }

  @GetMapping("/stock/updating/{id:.+}")
  public String updateStock(
    @PathVariable Long id,
    @ModelAttribute("product") Stock product,
    Model model
  ) {
    model.addAttribute("product_name", product.getProduct_name());
    stockRepo.updateProduct(id, product.getQuantity());

    model.addAttribute("products", stockRepo.viewAll());
    stockRepo.updateProduct(product.getProduct_id(), product.getQuantity());

    return "stock";
  }
}
