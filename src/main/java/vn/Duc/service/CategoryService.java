package vn.Duc.service;

import java.util.List;

import vn.Duc.entity.Category;

public interface CategoryService {
	
	List<Category> findByUserId(String userId);

	List<Category> findAll();

	Category findById(int cateId);

	void delete(int cateId, String username) throws Exception;

	void update(Category cate) throws Exception;

	void create(Category cate) throws Exception;

}
