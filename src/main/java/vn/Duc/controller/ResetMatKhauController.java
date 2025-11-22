package vn.Duc.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.Duc.service.UsersService;
import vn.Duc.service.Impl.UsersServiceImpl;

@WebServlet(urlPatterns = "/reset_matkhau")
public class ResetMatKhauController  extends HttpServlet {
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public static final String RESET_VIEW = "/views/reset_matkhau.jsp";

	 // GET: hiển thị form đổi mật khẩu
   @Override
   protected void doGet(HttpServletRequest req, HttpServletResponse resp)
           throws ServletException, IOException {

       req.getRequestDispatcher(RESET_VIEW).forward(req, resp);
   }

   // POST: xử lý đổi mật khẩu
   @Override
   protected void doPost(HttpServletRequest req, HttpServletResponse resp)
           throws ServletException, IOException {

       req.setCharacterEncoding("UTF-8");
       resp.setCharacterEncoding("UTF-8");

       String username       = req.getParameter("username");
       String newPassword    = req.getParameter("newPassword");
       String confirmPassword = req.getParameter("confirmPassword");

       String alertMsg = "";
       UsersService service = new UsersServiceImpl();

       // 1. Kiểm tra password nhập lại
       if (username == null || username.isEmpty() ) {
           alertMsg = "Vui lòng nhập tên đăng nhập!";
           req.setAttribute("alert", alertMsg);
           req.getRequestDispatcher(RESET_VIEW).forward(req, resp);
           return;
       }

       if (newPassword == null || !newPassword.equals(confirmPassword)) {
           alertMsg = "Mật khẩu nhập lại không khớp!";
           req.setAttribute("alert", alertMsg);
           req.getRequestDispatcher(RESET_VIEW).forward(req, resp);
           return;
       }
   
       
       
       boolean ok = service.resetMatKhau(username, newPassword);
       if (ok) {
           
           alertMsg = "Đổi mật khẩu thành công, hãy đăng nhập lại!";
           // nếu muốn mang alert sang login thì dùng session/flash, ở đây anh đơn giản redirect luôn
           resp.sendRedirect(req.getContextPath() + "/login");
       } else {
           // Không tìm thấy username hoặc lỗi DB
           alertMsg = "Không tìm thấy tài khoản hoặc lỗi hệ thống!";
           req.setAttribute("alert", alertMsg);
           req.getRequestDispatcher(RESET_VIEW).forward(req, resp);
       }
   }

}
