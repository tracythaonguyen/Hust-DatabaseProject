package hust.globalict.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import hust.globalict.entity.products.Item;

@Repository
public interface ItemRepository extends JpaRepository<Item, Long>{
	@Query(value = "SELECT product_id FROM product.items i WHERE i.serial_code=:serial_code",nativeQuery = true)
	Long getProductIdBySerialCode(@Param("serial_code") String serial_code);
}