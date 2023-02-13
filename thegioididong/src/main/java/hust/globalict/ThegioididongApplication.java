package hust.globalict;



import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication
@EnableJpaRepositories
public class ThegioididongApplication {
	public static void main(String[] args) {
		 SpringApplication app = new SpringApplication(ThegioididongApplication.class);
		 app.run(args);
	}

//	@Override
//	public void run(String... args) throws Exception {
//		// TODO Auto-generated method stub
//		List<ProductDetail> listProducts =productRepository.viewAllProduct();
//		listProducts.forEach(product-> System.out.println(product));
//	}

}
