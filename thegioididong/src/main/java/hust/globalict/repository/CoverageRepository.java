package hust.globalict.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import hust.globalict.entity.sales.Coverage;

@Repository
public interface CoverageRepository extends JpaRepository<Coverage, Long>{


}
