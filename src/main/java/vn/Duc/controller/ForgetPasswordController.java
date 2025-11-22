package vn.Duc.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import vn.Duc.entity.Users;
import vn.Duc.service.UsersService;
import vn.Duc.service.Impl.UsersServiceImpl;

@WebServlet(urlPatterns = "/forget-password")
public class ForgetPasswordController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private UsersService userService = new UsersServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		req.getRequestDispatcher("/views/user/forget-password.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		String email = req.getParameter("email");

		Users user = userService.findByEmail(email);

		if (user == null) {
			req.setAttribute("error", "Email không tồn tại");
			req.getRequestDispatcher("/views/user/forget-password.jsp").forward(req, resp);
			return;
		}

		req.setAttribute("message", "Mật khẩu của bạn là: " + user.getPassword());
		req.getRequestDispatcher("/views/user/forget-password.jsp").forward(req, resp);
	}
}
