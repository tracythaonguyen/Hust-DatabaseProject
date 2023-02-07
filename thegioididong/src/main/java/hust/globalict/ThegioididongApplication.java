package hust.globalict;



import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication
@EnableJpaRepositories
public class ThegioididongApplication {
//	 @Autowired
//	 private BrandRepository brandRepository;

	
	public static void main(String[] args) {
		 SpringApplication app = new SpringApplication(ThegioididongApplication.class);
		 app.run(args);
	}

//	@Override
//	public void run(String... args) throws Exception {
//		// TODO Auto-generated method stub
//		List<Brand> listBrands =brandRepository.listAll();
//		listBrands.forEach(brand-> System.out.println(brand));
//	}

}
