package controller;

import service.DishService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

@WebServlet(value = "/dish/delete")
public class DeleteDishServlet extends HttpServlet {
    private DishService dishService = new DishService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            System.out.println(123);
            Integer id = req.getParameter("id").length() > 0 ? Integer.parseInt(req.getParameter("id")) : 0;
            if (!dishService.deleteDish(id.toString())) {
                HashMap<String, ArrayList<String>> errors = dishService.getErrors();
                req.getSession().setAttribute("errors",errors);
                System.out.println(errors);
            }

            resp.sendRedirect("/dish");
        }catch (Exception exception){
            System.out.println(exception);
        }
    }
}