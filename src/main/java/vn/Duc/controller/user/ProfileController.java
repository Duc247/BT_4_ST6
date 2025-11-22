package vn.Duc.controller.user;

import java.io.File;
import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import vn.Duc.entity.Users;
import vn.Duc.service.UsersService;
import vn.Duc.service.Impl.UsersServiceImpl;
import vn.Duc.utils.Constant;

@WebServlet(urlPatterns = "/profile")
@MultipartConfig
public class ProfileController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private UsersService userService = new UsersServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        Users user = (Users) session.getAttribute(Constant.SESSION_LOGIN);

        if (user == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        req.setAttribute("user", user);
        req.getRequestDispatcher("/views/users/profile.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");

        HttpSession session = req.getSession(false);
        Users user = (Users) session.getAttribute(Constant.SESSION_LOGIN);

        if (user == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        // Lấy giá trị form
        String fullname = req.getParameter("fullname");
        String phone = req.getParameter("phone");
        Part filePart = req.getPart("images");

        String fileName = user.getImages(); // giữ file cũ

        // Nếu có upload file mới
        if (filePart != null && filePart.getSize() > 0) {

            String uploadPath = req.getServletContext().getRealPath(Constant.UPLOAD_FOLDER);
            File folder = new File(uploadPath);
            if (!folder.exists()) folder.mkdirs();

            String original = filePart.getSubmittedFileName();
            fileName = System.currentTimeMillis() + "_" + original;

            filePart.write(uploadPath + File.separator + fileName);
        }

        // Update user
        user.setFullname(fullname);
        user.setPhone(phone);
        user.setImages(fileName);

        try {
			userService.update(user);
		} catch (Exception e) {
			 req.setAttribute("alert", "Lỗi hệ thống: " + e.getMessage());
	          req.getRequestDispatcher("/views/users/profile.jsp").forward(req, resp);
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

        // Cập nhật session
        session.setAttribute(Constant.SESSION_LOGIN, user);

        req.setAttribute("success", "Cập nhật hồ sơ thành công!");
        req.setAttribute("user", user);

        req.getRequestDispatcher("/views/users/profile.jsp").forward(req, resp);
    }
}
