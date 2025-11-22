package vn.Duc.repository;

import java.util.List;

import vn.Duc.entity.Users;

public interface UsersRepository {
	
	List<Users> findAll();
	Users findByUserName(String username);
	void delete(String username);
	void update(Users entity);
	void create(Users entity);
	boolean existsUsername(String username);
	boolean existsEmail(String email);
	boolean existsPhone(String phone);
    Users findByEmail(String email);
    boolean resetMatKhau(String username, String password);

}
