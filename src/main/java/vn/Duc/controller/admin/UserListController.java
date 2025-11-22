package vn.Duc.controller.admin;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import vn.Duc.entity.Users;
import vn.Duc.service.UsersService;
import vn.Duc.service.Impl.UsersServiceImpl;

@WebServlet(urlPatterns = "/admin/user/list")
public class UserListController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private UsersService userService = new UsersServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        try {
            List<Users> list = userService.findAll();
            req.setAttribute("users", list);
        } catch (Exception e) {
            req.setAttribute("error", "Không thể tải danh sách người dùng!");
        }

        req.getRequestDispatcher("/views/admin/user-list.jsp").forward(req, resp);
    }
}
