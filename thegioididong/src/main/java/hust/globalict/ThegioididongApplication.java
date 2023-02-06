package hust.globalict;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.security.servlet.UserDetailsServiceAutoConfiguration;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

import hust.globalict.entity.products.Brand;
import hust.globalict.repository.BrandRepository;

@SpringBootApplication
@EnableJpaRepositories
public class ThegioididongApplication implements CommandLineRunner{
	 @Autowired
	 private BrandRepository brandRepository;

	
	public static void main(String[] args) {
		 SpringApplication app = new SpringApplication(ThegioididongApplication.class);
		 app.run(args);
	}

	@Override
	public void run(String... args) throws Exception {
		// TODO Auto-generated method stub
		List<Brand> listBrands =brandRepository.listAll();
		listBrands.forEach(brand-> System.out.println(brand));
	}

}
