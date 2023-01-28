package hust.globalict.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import hust.globalict.entity.products.Brand;

@Repository
public interface BrandRepository extends JpaRepository<Brand, Long>{

}
