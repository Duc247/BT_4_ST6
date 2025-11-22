package vn.Duc.controller.admin;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import vn.Duc.entity.Category;
import vn.Duc.entity.Users;
import vn.Duc.service.CategoryService;
import vn.Duc.service.Impl.CategoryServiceImpl;
import vn.Duc.utils.Constant;

@WebServlet(urlPatterns = "/admin/category/add")
@MultipartConfig(
    fileSizeThreshold = 1 * 1024 * 1024, // 1MB
    maxFileSize = 10 * 1024 * 1024,      // 10MB
    maxRequestSize = 20 * 1024 * 1024    // 20MB
)
public class CategoryAddController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private CategoryService cateService = new CategoryServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.getRequestDispatcher("/views/admin/category-add.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        HttpSession session = req.getSession(false);
        Users admin = (session != null) ? (Users) session.getAttribute(Constant.SESSION_LOGIN) : null;

        // chưa login hoặc không phải admin → đá về login
        if (admin == null || !Boolean.TRUE.equals(admin.getAdmin())) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        try {
            String name = req.getParameter("name");
            String code = req.getParameter("code");
            Boolean status = req.getParameter("status") != null;

            // ====== xử lý upload ảnh ======
            Part imagePart = req.getPart("image"); // name="image" bên jsp
            String fileName = null;

            if (imagePart != null && imagePart.getSize() > 0) {
                String uploadPath = req.getServletContext()
                        .getRealPath("/uploads/categories/");

                File dir = new File(uploadPath);
                if (!dir.exists()) dir.mkdirs();

                String original = Paths.get(imagePart.getSubmittedFileName())
                                      .getFileName().toString();
                fileName = System.currentTimeMillis() + "_" + original;

                imagePart.write(uploadPath + File.separator + fileName);
            }

            // ====== tạo Category ======
            Category c = new Category();
            c.setCategoryName(name);
            c.setCategoryCode(code);
            c.setImages(fileName);
            c.setStatus(status);

            // QUAN TRỌNG: gán owner
            c.setUser(admin);

            cateService.create(c);

            resp.sendRedirect(req.getContextPath() + "/admin/category/list");

        } catch (Exception e) {
            req.setAttribute("error", e.getMessage());
            req.getRequestDispatcher("/views/admin/category-add.jsp").forward(req, resp);
        }
    }
}
