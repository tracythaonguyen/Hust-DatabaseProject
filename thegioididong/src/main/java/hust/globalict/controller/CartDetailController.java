package hust.globalict.controller;

import hust.globalict.entity.sales.CartDetail;
import hust.globalict.repository.CartDetailRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CartDetailController {
  @Autowired
  private CartDetailRepository cartDetailRepo;

  public CartDetailController(CartDetailRepository cartDetailRepo) {
    this.cartDetailRepo = cartDetailRepo;
  }

  @GetMapping("/cartdetails")
  public String listProductCart(
    @Param("customer_id") Integer customer_id,
    Model model
  ) {
    model.addAttribute(
      "cartdetails",
      cartDetailRepo.viewAllProduct(customer_id)
    );
    return "cart_detail";
  }
}
