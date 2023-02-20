package hust.globalict.controller;

import hust.globalict.entity.products.ProductDetail;
import hust.globalict.repository.ProductDetailRepository;
import hust.globalict.repository.ProductRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class ProductDetailController {
  @Autowired
  private ProductDetailRepository productDetailRepo;

  @Autowired
  private ProductRepository productRepo;

  public ProductDetailController(ProductDetailRepository productRepo) {
    this.productDetailRepo = productDetailRepo;
  }

  @GetMapping("/productdetails")
  public String listProductMenu(Model model) {
    model.addAttribute("productdetails", productDetailRepo.viewAllProduct());
    return "productdetailsoptionmenu";
  }

  @GetMapping("/productdetails/view_top_products")
  public String viewProduct(@Param("num") Integer num, Model model) {
    if (num != null) {
      model.addAttribute("num", num);
      model.addAttribute(
        "productdetails",
        productDetailRepo.viewProductsLimit(num)
      );
    } else {
      model.addAttribute("productdetails", productDetailRepo.viewAllProduct());
    }
    return "productdetails";
  }

  @GetMapping("/productdetails/search_by_name")
  public String searchProductByName(@Param("name") String name, Model model) {
    if (name != null) {
      model.addAttribute("name", name);
      List<ProductDetail> productdetails = productDetailRepo.searchProductByName(
        name
      );
      model.addAttribute("productdetails", productdetails);
    } else {
      model.addAttribute("productdetails", productDetailRepo.viewAllProduct());
    }
    return "Search_product_by_name";
  }

  @GetMapping("/productdetails/search_by_brand")
  public String searchProductByBrand(
    @Param("brand") String brand,
    Model model
  ) {
    if (brand != null) {
      model.addAttribute("brand", brand);
      List<ProductDetail> productdetails = productDetailRepo.searchProductByBrand(
        brand
      );
      model.addAttribute("productdetails", productdetails);
    } else {
      model.addAttribute("productdetails", productDetailRepo.viewAllProduct());
    }
    return "Search_product_by_brand";
  }

  @GetMapping("/productdetails/search_by_category")
  public String searchProductByCategory(
    @Param("category") String category,
    Model model
  ) {
    if (category != null) {
      model.addAttribute("category", category);
      List<ProductDetail> productdetails = productDetailRepo.searchProductByCategory(
        category
      );
      model.addAttribute("productdetails", productdetails);
    } else {
      model.addAttribute("productdetails", productDetailRepo.viewAllProduct());
    }
    return "Search_product_by_category";
  }

  @GetMapping("/discontinueProduct/{id:.+}")
  public String discontinueProduct(
    @PathVariable Long id,
    Model model,
    RedirectAttributes redirectAttributes
  ) {
    try {
      if (id != null) {
        productRepo.discontinueProductById(id);
        redirectAttributes.addFlashAttribute(
          "message",
          "Delete successfully: " + id
        );
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
    return "redirect:/productdetails";
  }

  @GetMapping("/customer_menu")
  public String customerMenu(Model model) {
    model.addAttribute("productdetails", productDetailRepo.viewAllProduct());
    return "customer_menu";
  }

  @GetMapping("/customer_menu/view_top_products")
  public String viewProductCustomer(@Param("num") Integer num, Model model) {
    if (num != null) {
      model.addAttribute("num", num);
      model.addAttribute(
        "productdetails",
        productDetailRepo.viewProductsLimit(num)
      );
    } else {
      model.addAttribute("productdetails", productDetailRepo.viewAllProduct());
    }
    return "customer_menu_top";
  }

  @GetMapping("/customer_menu/search_by_name")
  public String searchProductByNameCustomer(
    @Param("name") String name,
    Model model
  ) {
    if (name != null) {
      model.addAttribute("name", name);
      List<ProductDetail> productdetails = productDetailRepo.searchProductByName(
        name
      );
      model.addAttribute("productdetails", productdetails);
    } else {
      model.addAttribute("productdetails", productDetailRepo.viewAllProduct());
    }
    return "customer_menu_by_name";
  }

  @GetMapping("/customer_menu/search_by_brand")
  public String searchProductByBrandCustomer(
    @Param("brand") String brand,
    Model model
  ) {
    if (brand != null) {
      model.addAttribute("brand", brand);
      List<ProductDetail> productdetails = productDetailRepo.searchProductByBrand(
        brand
      );
      model.addAttribute("productdetails", productdetails);
    } else {
      model.addAttribute("productdetails", productDetailRepo.viewAllProduct());
    }
    return "customer_menu_by_brand";
  }

  @GetMapping("/customer_menu/search_by_category")
  public String searchProductByCategoryCustomer(
    @Param("category") String category,
    Model model
  ) {
    if (category != null) {
      model.addAttribute("category", category);
      List<ProductDetail> productdetails = productDetailRepo.searchProductByCategory(
        category
      );
      model.addAttribute("productdetails", productdetails);
    } else {
      model.addAttribute("productdetails", productDetailRepo.viewAllProduct());
    }
    return "customer_menu_by_category";
  }
}
