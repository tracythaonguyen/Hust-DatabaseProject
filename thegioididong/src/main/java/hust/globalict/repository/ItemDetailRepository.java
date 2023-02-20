package hust.globalict.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import hust.globalict.entity.products.ItemDetail;
import hust.globalict.entity.products.ProductDetail;

@Repository
public interface ItemDetailRepository extends JpaRepository<ItemDetail, Long>{
	  @Query(
			    value = "SELECT * FROM product.view_available_item(:id);",
			    nativeQuery = true
			  )
			  List<ItemDetail> viewAllItem(@Param("id") Long id);
}
