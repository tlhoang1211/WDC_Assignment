package controller;

import entity.Category;
import entity.Data;
import service.CategoryService;
import service.DishService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Locale;

@WebServlet(value = "/dish")
public class ListDishServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String page = req.getParameter("pages");
            String perPage = req.getParameter("perPage");
            DishService dishService = new DishService();
            CategoryService categoryService = new CategoryService();
            List<Category> categories = categoryService.all();
            Data dataReturn = dishService.getListDish(page, perPage);
            req.setAttribute("dataReturn", dataReturn);
            req.setAttribute("categories", categories);
            req.setAttribute("errors", req.getSession().getAttribute("errors"));


            req.getRequestDispatcher("/dish/list.jsp").forward(req, resp);
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}