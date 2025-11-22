package vn.Duc.service.Impl;

import java.util.List;

import vn.Duc.entity.Category;
import vn.Duc.entity.Users;
import vn.Duc.repository.UsersRepository;
import vn.Duc.repository.Impl.CategoryRepositoryImpl;
import vn.Duc.repository.Impl.UsersRepositoryImpl;
import vn.Duc.service.CategoryService;

public class CategoryServiceImpl implements CategoryService{
	
	
	CategoryRepositoryImpl categoryRepo = new CategoryRepositoryImpl();
	UsersRepository userRepo = new UsersRepositoryImpl();

	@Override
	public void create(Category cate) throws Exception {
	    if (cate.getCategoryName() == null || cate.getCategoryName().isBlank()) {
	        throw new Exception("Tên category không được bỏ trống");
	    }

	    // đúng logic: thiếu user hoặc thiếu username thì báo lỗi
	    if (cate.getUser() == null || cate.getUser().getUsername() == null 
	            || cate.getUser().getUsername().isBlank()) {
	        throw new Exception("Category phải thuộc về 1 user");
	    }

	    Users user = userRepo.findByUserName(cate.getUser().getUsername());
	    if (user == null) {
	        throw new Exception("User không tồn tại");
	    }

	    List<Category> list = categoryRepo.findByUserId(user.getUsername());
	    for (Category c : list) {
	        if (c.getCategoryName().equalsIgnoreCase(cate.getCategoryName())) {
	            throw new Exception("Category này đã tồn tại");
	        }
	    }

	    cate.setUser(user); // gắn lại user chuẩn từ DB
	    categoryRepo.create(cate);
	}


    @Override
	public void update(Category cate) throws Exception {

        Category old = categoryRepo.findById(cate.getCategoryId());

        if (old == null) {
            throw new Exception("Category không tồn tại");
        }

        if (cate.getCategoryName() == null || cate.getCategoryName().isEmpty()) {
            throw new Exception("Tên category không được bỏ trống");
        }

        // kiểm tra trùng tên với category khác
        List<Category> list = categoryRepo.findByUserId(old.getUser().getUsername());
        for (Category c : list) {
            if (c.getCategoryName() != cate.getCategoryName()
                && c.getCategoryName().equalsIgnoreCase(cate.getCategoryName())) {

                throw new Exception("Tên category đã tồn tại");
            }
        }

        categoryRepo.update(cate);
    }


    @Override
	public void delete(int cateId, String username) throws Exception {

        Category cate = categoryRepo.findById(cateId);

        if (cate == null) {
            throw new Exception("Category không tồn tại");
        }
        if (cate.getUser().getUsername() != username) {
            throw new Exception("Bạn không có quyền xóa category này");
        }

        categoryRepo.delete(cateId);
    }


    @Override
	public Category findById(int id) {
        return categoryRepo.findById(id);
    }

    @Override
	public List<Category> findAll() {
        return categoryRepo.findAll();
    }

    @Override
	public List<Category> findByUserId(String userId) {
        return categoryRepo.findByUserId(userId);
    }
	

}