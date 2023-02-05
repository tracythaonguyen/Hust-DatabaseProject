package hust.globalict.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import hust.globalict.entity.products.Item;

@Repository
public interface ItemRepository extends JpaRepository<Item, Long>{

}