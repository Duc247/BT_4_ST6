package vn.Duc.controller.admin;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import vn.Duc.entity.Category;
import vn.Duc.service.CategoryService;
import vn.Duc.service.Impl.CategoryServiceImpl;

@WebServlet(urlPatterns = "/admin/category/edit")
public class CategoryEditController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private CategoryService cateService = new CategoryServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		int id = Integer.parseInt(req.getParameter("id"));
		Category c = cateService.findById(id);

		req.setAttribute("category", c);
		req.getRequestDispatcher("/views/admin/category-edit.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		try {
			int id = Integer.parseInt(req.getParameter("id"));

			Category c = cateService.findById(id);
			c.setCategoryName(req.getParameter("name"));
			c.setCategoryCode(req.getParameter("code"));
			c.setImages(req.getParameter("image"));
			c.setStatus(req.getParameter("status") != null);

			cateService.update(c);

			resp.sendRedirect(req.getContextPath() + "/admin/category/list");
		} catch (Exception e) {
			req.setAttribute("error", e.getMessage());
			req.getRequestDispatcher("/views/admin/category-edit.jsp").forward(req, resp);
		}
	}
}
