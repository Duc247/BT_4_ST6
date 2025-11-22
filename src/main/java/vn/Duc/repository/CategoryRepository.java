package vn.Duc.repository;

import java.util.List;

import vn.Duc.entity.Category;

public interface CategoryRepository {
	List<Category> findByUserId(String userId);

	List<Category> findAll();

	Category findById(int cateId);

	void delete(int cateId);

	void update(Category entity);

	void create(Category entity);

}
