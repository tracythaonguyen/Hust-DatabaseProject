package hust.globalict.controller;

import hust.globalict.repository.StaffRepository;
import hust.globalict.repository.StaffRevenueRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class StaffController {
  @Autowired
  private StaffRepository staffRepo;

  @Autowired
  private StaffRevenueRepository staffReveRepo;

  public StaffController(StaffRevenueRepository staffRevenueRepo) {
    this.staffReveRepo = staffReveRepo;
  }

  @GetMapping("/staff_revenue")
  public String staffRevenure(Model model) {
    model.addAttribute("staffrevenue", staffReveRepo.viewAll());
    return "staff_revenue";
  }
}
