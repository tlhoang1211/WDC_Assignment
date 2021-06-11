package repository;

import entity.Dish;
import entity.Category;
import helper.GenericModel;

import java.util.List;

public class CategoryRepository {
    private GenericModel<Category> genericModel = new GenericModel<>(Category.class);
    public List<Category> getAll(){
        return genericModel.findAll();
    }
}