package vn.Duc.controller.admin;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import vn.Duc.service.CategoryService;
import vn.Duc.service.Impl.CategoryServiceImpl;

@WebServlet(urlPatterns =  "/admin/category/delete")
public class CategoryDeleteController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private CategoryService cateService = new CategoryServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		try {
			int id = Integer.parseInt(req.getParameter("id"));
			String username = req.getParameter("name");
			cateService.delete(id,username);

			resp.sendRedirect(req.getContextPath() + "/admin/category/list");
		} catch (Exception e) {
			resp.sendRedirect(req.getContextPath() + "/admin/category/list?error=" + e.getMessage());
		}
	}
}
