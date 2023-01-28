package hust.globalict.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import hust.globalict.entity.sys.Role;

@Repository
public interface RoleRepository extends JpaRepository<Role, Long>{

}