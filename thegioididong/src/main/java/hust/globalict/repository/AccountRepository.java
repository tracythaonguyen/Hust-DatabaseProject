package hust.globalict.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import hust.globalict.entity.sys.Account;

@Repository
public interface AccountRepository extends JpaRepository<Account, Long>{

}