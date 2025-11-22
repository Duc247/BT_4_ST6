package vn.Duc.service.Impl;

import java.util.List;

import vn.Duc.entity.Users;
import vn.Duc.repository.UsersRepository;
import vn.Duc.repository.Impl.UsersRepositoryImpl;
import vn.Duc.service.UsersService;

public class UsersServiceImpl implements UsersService {

	
    UsersRepository userRepo = new UsersRepositoryImpl();

	@Override
	public Users login(String username, String password) {
		
	    List<Users> users = userRepo.findAll();

	    for (Users u : users) {
	        if (u.getUsername().equals(username) &&
	            u.getPassword().equals(password)) {
	            return u; 
	        }
	    }

	    return null; 
	}


    @Override
	public void create(Users user) throws Exception {

        if (user.getUsername() == null || user.getUsername().isEmpty()) {
            throw new Exception("Username không được bỏ trống");
        }

        if (user.getPassword() == null || user.getPassword().isEmpty()) {
            throw new Exception("Password không được bỏ trống");
        }
        
        if (user.getPassword().length() < 6) {
        	
            throw new Exception("Password phải có ít nhất 6 ký tự");
            
        }
        
        if (user.getPassword().length() >= 6) {
        	
        	 String regex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{8,}$";     	
        	 Boolean valid = user.getPassword().matches(regex);
        	 if (!valid) {
        		 throw new Exception("Password phải có chữ thường, chữ hoa, số, kí tự đặc biệt");          
        	 }
            
        }
        
        if (user.getEmail() == null || user.getEmail().isEmpty()) {
            throw new Exception("Email không được bỏ trống");
        }
        if (userRepo.existsUsername(user.getUsername())) {
        	throw new Exception("Username đã tồn tại");
        }
        if (userRepo.existsEmail(user.getEmail())) {
        	throw new Exception("Email đã tồn tại");
        }
        if (user.getPhone() != null &&  !user.getPhone().isEmpty()) {
        	if (userRepo.existsPhone(user.getPhone())) {
        		throw new Exception("Số điện thoại đã tồn tại");
        	}
        }
 
        userRepo.create(user);
    }



    @Override
   
    public void update(Users user) throws Exception {

 

        
        userRepo.update(user);
    }




    @Override
	public void delete(String username) throws Exception {

        Users old = userRepo.findByUserName(username);

        if (old == null) {
            throw new Exception("User không tồn tại");
        }

        if (old.getCategories() != null && !old.getCategories().isEmpty()) {
            throw new Exception("Không thể xoá user vì đang sở hữu các category");
        }
        userRepo.delete(username);
    }



    
    @Override
    public boolean checkExistUsername(String username) {
        return userRepo.existsUsername(username);
    }

    @Override
    public boolean checkExistEmail(String email) {
        return userRepo.existsEmail(email);
    }

    @Override
    public boolean checkExistPhone(String phone) {
        return userRepo.existsPhone(phone);
    }
    
    @Override
    public Users findByEmail(String email) {
        return userRepo.findByEmail(email);
    }


	@Override
	public List<Users> findAll() {
		return userRepo.findAll();
	}


	@Override
	public Users findById(String username) {
		return userRepo.findByUserName(username);
	}


	@Override
	public boolean resetMatKhau(String username, String password) {
		return userRepo.resetMatKhau(username, password);
	}
	
	
}
