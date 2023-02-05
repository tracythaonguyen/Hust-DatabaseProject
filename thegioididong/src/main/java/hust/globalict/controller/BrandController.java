//package hust.globalict.controller;
//
//import java.util.List;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.PostMapping;
//
//import hust.globalict.entity.products.Brand;
//import hust.globalict.repository.BrandRepository;
//
//@Controller
//public class BrandController {
//	@Autowired
//    private BrandRepository brandRepo;
//	
//	@PostMapping("listbrand")
//	public List<Brand> listBrand(){
//		return brandRepo.listAll();
//	}
//}
