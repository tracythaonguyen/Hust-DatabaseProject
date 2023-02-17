package hust.globalict.service;

import org.springframework.security.core.userdetails.UserDetailsService;

import hust.globalict.DTO.AccountRegistrationDto;
import hust.globalict.entity.sys.Account;

public interface AccountService extends UserDetailsService{
	Account save(AccountRegistrationDto registrationDto);
}
