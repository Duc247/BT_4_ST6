package vn.Duc.controller.admin;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import vn.Duc.entity.Category;
import vn.Duc.service.CategoryService;
import vn.Duc.service.Impl.CategoryServiceImpl;

@WebServlet(urlPatterns = "/admin/category/list")
public class CategoryController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private CategoryService cateService = new CategoryServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		List<Category> list = cateService.findAll();

		req.setAttribute("categories", list);

		req.getRequestDispatcher("/views/admin/category-list.jsp").forward(req, resp);
	}
}
