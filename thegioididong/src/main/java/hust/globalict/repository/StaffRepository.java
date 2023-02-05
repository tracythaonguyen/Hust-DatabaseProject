package hust.globalict.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import hust.globalict.entity.sales.Staff;

@Repository
public interface StaffRepository extends JpaRepository<Staff, Long>{

}
