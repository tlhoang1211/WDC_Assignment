package controller;

import entity.Dish;
import entity.Category;
import entity.Data;
import helper.GenericValidate;
import service.CategoryService;
import service.DishService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@WebServlet(value = "/dish/edit")
public class EditDishServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String id = req.getParameter("id");
            DishService dishService = new DishService();
            CategoryService categoryService = new CategoryService();
            List<Category> categories = categoryService.all();
            Dish dish = dishService.detailDish(id);
            req.setAttribute("dish", dish);
            req.setAttribute("categories", categories);

            req.getRequestDispatcher("/admin/dish/edit.jsp").forward(req, resp);
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            Integer id = req.getParameter("id").length() > 0 ? Integer.parseInt(req.getParameter("id")) : 0;
            String name = req.getParameter("name").length() > 0 ? req.getParameter("name") : "";
            int categoryId = req.getParameter("categoryId").length() > 0 ? Integer.parseInt(req.getParameter("categoryId")) : 0;
            int status = req.getParameter("status").length() > 0 ? Integer.parseInt(req.getParameter("status")) : 0;
            String code = req.getParameter("code").length() > 0 ? req.getParameter("code") : "" ;
            String description = req.getParameter("description").length() > 0 ? req.getParameter("description") : "" ;
            String avatar = req.getParameter("thumbnails[]").length() > 0 ? req.getParameter("thumbnails[]") : "" ;
            Double price = req.getParameter("price").length() > 0 ? Double.parseDouble(req.getParameter("price")) : 0.0;
            System.out.println(123);
            Dish dish = new Dish(id, code, name, categoryId, description, avatar, price,status);
            DishService dishService = new DishService();
            CategoryService categoryService = new CategoryService();
            List<Category> categories = categoryService.all();
            GenericValidate<Dish> dishGenericValidateClass = new GenericValidate<>(Dish.class);
            if(!dishGenericValidateClass.validate(dish)){
                System.out.println("Have Error");
                HashMap<String, ArrayList<String>> errors = dishGenericValidateClass.getErrors();
                System.out.println(errors);
                req.setAttribute("errors", errors);
                req.setAttribute("dish", dish);
                req.getRequestDispatcher("/admin/dish/edit.jsp").forward(req, resp);
                return;
            }
            if (!dishService.updateDish(id.toString(), dish)){
                HashMap<String, ArrayList<String>> errors = dishService.getErrors();
                req.getSession().setAttribute("errors",errors);
            }

            req.setAttribute("dish", dish);
            req.setAttribute("categories", categories);
            resp.sendRedirect("/dish");
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}