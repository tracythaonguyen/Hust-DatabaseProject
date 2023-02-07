package hust.globalict.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import hust.globalict.entity.sales.Cart;

@Repository
public interface CartRepository extends JpaRepository<Cart, Long>{

}
