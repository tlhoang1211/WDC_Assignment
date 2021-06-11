package service;

import entity.Data;
import entity.Dish;
import repository.DishRepository;

import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

public class DishService {
    private DishRepository dishRepository = new DishRepository();
    private HashMap<String, ArrayList<String>> errors = new HashMap<>();

    public Dish createDish(Dish dish) {
        System.out.println("start create dish");
        java.sql.Date date = new Date(System.currentTimeMillis());
        dish.setSellDate(date);
        dish.setUpdatedAt(date);
        dishRepository.save(dish);

        return dish;
    }

    public Data getListDish(String page, String perPage) {

        try {
            int ipage = 1;
            int iperPage = 5;
            if (page != null) {
                ipage = Integer.parseInt(page);
            }
            if (perPage != null) {
                iperPage = Integer.parseInt(perPage);
            }
            if (iperPage == 0) {
                iperPage = 5;
            }
            if (ipage == 0) {
                ipage = 1;
            }

            int totalItem = dishRepository.getTotalItem().size();
            int totalPage = totalItem / iperPage;
            if (totalItem % iperPage > 0){
                totalPage += 1;
            }
            int currentPage = ipage;
            if (ipage > totalPage) {
                currentPage = totalPage;
            }
            System.out.println(currentPage);
            System.out.println(ipage);
            ArrayList<Dish> myDish = new ArrayList<Dish>(dishRepository.getListDish(ipage - 1, iperPage));

            Data dataReturn = new Data();
            dataReturn.setListDish(myDish);
            dataReturn.setCurrentPage(currentPage);
            dataReturn.setTotalPages(totalPage);

            return dataReturn;
        } catch (Exception e) {
            return new Data();
        }
    }

    public Dish detailDish(String name) {
        if (name.length() == 0) {
            name = "";
        }
        System.out.println(name);
        return dishRepository.getDetailDish(name);
    }

    public boolean updateDish(String id, Dish obj) throws InstantiationException, IllegalAccessException, SQLException {
        Dish exist = dishRepository.getDetailDish(id);
        ArrayList<String> bugs = new ArrayList<String>();
        if (exist == null) {
            bugs.add("The records no longer existed");
            errors.put("records", bugs);
            return false;
        }
        obj.setUpdatedAt(new Date(System.currentTimeMillis()));
        obj.setSellDate(exist.getSellDate());

        dishRepository.update(id, obj);
        return true;
    }

    public boolean deleteDish(String id) throws SQLException, InstantiationException, IllegalAccessException {
        Dish exist = dishRepository.getDetailDish(id);
        ArrayList<String> bugs = new ArrayList<String>();
        if (exist == null) {
            bugs.add("The records no longer existed");
            errors.put("records", bugs);
            return false;
        }
        System.out.println(exist.getSellDate());
        exist.setUpdatedAt(new Date(System.currentTimeMillis()));
        exist.setDeleteAt(new Date(System.currentTimeMillis()));
        exist.setStatus(3);

        return dishRepository.update(id,exist);
    }

    public HashMap<String, ArrayList<String>> getErrors() {
        return errors;
    }

    public void setErrors(HashMap<String, ArrayList<String>> errors) {
        this.errors = errors;
    }
}
