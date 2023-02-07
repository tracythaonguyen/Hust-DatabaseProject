package hust.globalict.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import hust.globalict.entity.products.Config;

@Repository
public interface ConfigRepository extends JpaRepository<Config, Long>{

}