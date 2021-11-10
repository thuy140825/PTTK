package dao;

import java.util.List;

import model.Category;

public interface CategoryDAO {
	
	// them
	Category addCategory(Category category);
	// sua
	void updateCategory(Category category);
	// xoa
	boolean removeCategory(int id);
	// lay danh sach
	List<Category> getAllCategories();
	// tim category theo ma
	Category getCategoryById(int id);
}
