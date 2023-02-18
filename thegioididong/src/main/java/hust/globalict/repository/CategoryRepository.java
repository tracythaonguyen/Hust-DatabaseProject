package hust.globalict.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import hust.globalict.entity.products.Brand;
import hust.globalict.entity.products.Category;

@Repository
public interface CategoryRepository extends JpaRepository<Category, Long>{
	@Query(value = "SELECT * FROM product.categories",nativeQuery = true)
	List<Category> listAll();
	
	@Query(value = "CALL product.new_category(:category_name)",nativeQuery = true)
	void addNewCategory(@Param("category_name")String category_name);
}
