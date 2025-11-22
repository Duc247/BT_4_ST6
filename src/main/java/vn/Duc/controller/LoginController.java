package vn.Duc.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import vn.Duc.entity.Users;
import vn.Duc.service.UsersService;
import vn.Duc.service.Impl.UsersServiceImpl;
import vn.Duc.utils.Constant;

@WebServlet(urlPatterns = "/login")
public class LoginController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private UsersService userService = new UsersServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        // Nếu đã có session → vào đúng trang home tương ứng
        HttpSession session = req.getSession(false);
        Users user = (session == null) ? null : (Users) session.getAttribute(Constant.SESSION_LOGIN);

        if (user != null) {
            if (user.getAdmin()) {
                resp.sendRedirect(req.getContextPath() + "/admin/home");
            } else {
                resp.sendRedirect(req.getContextPath() + "/user/home");
            }
            return;
        }

        // Kiểm tra cookie Remember Me
        Cookie[] cookies = req.getCookies();
        if (cookies != null) {
            for (Cookie c : cookies) {
                if (c.getName().equals(Constant.COOKIE_REMEMBER)) {
                    req.setAttribute("rememberedUser", c.getValue());
                }
            }
        }

        req.getRequestDispatcher("/views/login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String remember = req.getParameter("remember");

        if (username == null || username.isBlank() ||
            password == null || password.isBlank()) {
            req.setAttribute("alert", "Không được để trống tài khoản hoặc mật khẩu!");
            req.getRequestDispatcher("/views/login.jsp").forward(req, resp);
            return;
        }

        // Kiểm tra user
        Users user = userService.login(username, password);

        if (user == null) {
            req.setAttribute("alert", "Sai tài khoản hoặc mật khẩu!");
            req.getRequestDispatcher("/views/login.jsp").forward(req, resp);
            return;
        }

        if (Boolean.FALSE.equals(user.getActive())) {
            req.setAttribute("alert", "Tài khoản đã bị khóa!");
            req.getRequestDispatcher("/views/login.jsp").forward(req, resp);
            return;
        }

        // Tạo session
        HttpSession session = req.getSession(true);
        session.setAttribute(Constant.SESSION_LOGIN, user);

        // Remember me
        boolean rememberMe = "on".equals(remember);
        if (rememberMe) {
            saveRememberMe(resp, username);
        } else {
            clearRememberMe(resp);
        }

        // Chuyển đúng trang role
        if (user.getAdmin()) {
            resp.sendRedirect(req.getContextPath() + "/admin/home");
        } else {
            resp.sendRedirect(req.getContextPath() + "/user/home");
        }
    }

    private void saveRememberMe(HttpServletResponse resp, String username) {
        Cookie cookie = new Cookie(Constant.COOKIE_REMEMBER, username);
        cookie.setMaxAge(7 * 24 * 60 * 60); 
        cookie.setPath("/");
        resp.addCookie(cookie);
    }

    private void clearRememberMe(HttpServletResponse resp) {
        Cookie cookie = new Cookie(Constant.COOKIE_REMEMBER, "");
        cookie.setMaxAge(0);
        cookie.setPath("/");
        resp.addCookie(cookie);
    }
}
