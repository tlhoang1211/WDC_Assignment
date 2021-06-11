package controller;

import entity.Dish;
import entity.Category;
import service.CategoryService;
import service.DishService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(value = "/dish/detail")
public class DetailDishServlet extends HttpServlet {
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

            req.getRequestDispatcher("/admin/dish/detail.jsp").forward(req, resp);
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}