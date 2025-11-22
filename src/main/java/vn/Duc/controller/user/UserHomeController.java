package vn.Duc.controller.user;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;


@WebServlet(urlPatterns = "/user/home")
public class UserHomeController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

     
        // Forward đến giao diện
        req.getRequestDispatcher("/views/users/home.jsp").forward(req, resp);
    }
}
