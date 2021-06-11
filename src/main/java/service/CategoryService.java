package service;

import entity.Category;
import repository.CategoryRepository;

import java.util.List;

public class CategoryService {
    private CategoryRepository categoryRepository = new CategoryRepository();
    public List<Category> all(){
        return categoryRepository.getAll();
    }
}