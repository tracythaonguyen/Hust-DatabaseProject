package hust.globalict.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import hust.globalict.entity.products.Stock;

@Repository
public interface StockRepository extends JpaRepository<Stock, Long>{

}
