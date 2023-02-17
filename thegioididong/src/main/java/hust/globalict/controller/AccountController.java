package hust.globalict.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import hust.globalict.entity.sys.Account;
import hust.globalict.repository.AccountRepository;

@Controller
public class AccountController {
	@Autowired
    private AccountRepository accountRepo;
	
	@GetMapping("/home")
	public String homeMenu(@ModelAttribute Account account, Model model){
	   Account account1= accountRepo.findByUsername(account.getUser_name(),account.getPassword());
	   model.addAttribute("account1",account1);
	   return "homemenu";
	}
	
	@GetMapping("/home/customer/menu")
	public String customerMenu(Model model) {
		return "customermenu";
	}
	
	@GetMapping("/home/manager/menu")
	public String managerMenu(Model model) {
		return "managermenu";
	}
	
	@GetMapping("/home/admin/menu")
	public String mangagerMenu(Model model) {
		return "adminmenu";
	}
	
	@GetMapping("/account/login")
	public String loginPage(@Param("name") String user_name,@Param("password") String password,Model model) {
		if(user_name!= null) {
			model.addAttribute("user_name", user_name);
			model.addAttribute("password", password);
			Account account= accountRepo.findByUsername(user_name,password);
			model.addAttribute("account",account);
		}else {
			//pass
		}
		return "login";
	}
}
