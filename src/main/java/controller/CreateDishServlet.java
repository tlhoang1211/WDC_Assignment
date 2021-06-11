package controller;

import entity.Dish;
import helper.GenericValidate;
import service.DishService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

@WebServlet(value = "/dish/form")
public class CreateDishServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/admin/dish/form.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        int categoryId = Integer.parseInt(req.getParameter("categoryId"));
        String name = req.getParameter("name");
        String code = req.getParameter("code");
        double price = req.getParameter("price").length() > 0 ? Double.parseDouble(req.getParameter("price")) : 0;
        String thumbnails = req.getParameter("thumbnails[]");
        String description = req.getParameter("description");
        System.out.println(thumbnails);

        Dish dish = new Dish(code, name, categoryId, description, thumbnails, price);
        System.out.println(dish);
        GenericValidate<Dish> dishGenericValidateClass = new GenericValidate<>(Dish.class);
        dishGenericValidateClass.validate(dish);
        if(!dishGenericValidateClass.validate(dish)){
            System.out.println("Error!!");
            HashMap<String, ArrayList<String>> errors = dishGenericValidateClass.getErrors();
            System.out.println(errors);
            req.setAttribute("errors", errors);
            req.setAttribute("dish", dish);
            req.getRequestDispatcher("/admin/dish/form.jsp").forward(req, resp);
            return;
        }
        DishService dishService = new DishService();
        dishService.createDish(dish);
        resp.sendRedirect("/dish");
    }
}