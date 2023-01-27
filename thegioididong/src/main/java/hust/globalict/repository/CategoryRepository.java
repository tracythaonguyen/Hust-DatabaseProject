package hust.globalict.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import hust.globalict.entity.product.Category;

@Repository
public interface CategoryRepository extends JpaRepository<Category, Long>{

}
