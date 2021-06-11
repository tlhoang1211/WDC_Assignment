package repository;

import entity.Dish;
import entity.SqlCondition;
import helper.GenericModel;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

public class DishRepository {
    private GenericModel<Dish> genericModel = new GenericModel<>(Dish.class);

    public boolean save(Dish dish) {
        return genericModel.save(dish);
    }

    public List<Dish> getListDish(int page, int perPage) {
        return genericModel.findAll(page, perPage);
    }

    public List<Dish> getTotalItem() {
        return genericModel.findAll();
    }

    public Dish getDetailDish(String name) {
        HashMap<String, SqlCondition> condition = new HashMap<>();
        condition.put("id", new SqlCondition('=', name));

        return genericModel.findByColumns(condition);
    }

    public boolean update(String id, Dish obj) throws InstantiationException, IllegalAccessException, SQLException {
        Dish existStudent = genericModel.findById(id);
        if (existStudent == null) {
            return false;
        }
        genericModel.update(id, obj);
        return true;
    }

    public boolean delete(String id) throws SQLException {
        Dish existStudent = genericModel.findById(id);
        if(existStudent == null){
            return false;
        }
        genericModel.delete(id);
        return true;
    }
}