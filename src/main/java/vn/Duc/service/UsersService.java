package vn.Duc.service;

import java.util.List;

import vn.Duc.entity.Users;

public interface UsersService {

	List<Users> findAll();

	Users findById(String username);

	void delete(String username) throws Exception;

	void update(Users user) throws Exception;

	void create(Users user) throws Exception;

	
	Users login(String username, String password);
	
	boolean checkExistUsername(String username);
	
	boolean checkExistEmail(String email);
	
	boolean checkExistPhone(String phone);
	
    Users findByEmail(String email);
    boolean resetMatKhau(String username, String password);

}
