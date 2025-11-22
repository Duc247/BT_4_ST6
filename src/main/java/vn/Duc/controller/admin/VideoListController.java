package vn.Duc.controller.admin;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import vn.Duc.entity.Videos;
import vn.Duc.service.VideosService;
import vn.Duc.service.Impl.VideosServiceImpl;

@WebServlet(urlPatterns = "/admin/video/list")
public class VideoListController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private VideosService videoService = new VideosServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        try {
            List<Videos> list = videoService.findAll();
            req.setAttribute("videos", list);
        } catch (Exception e) {
            req.setAttribute("error", "Không thể tải danh sách video!");
        }

        req.getRequestDispatcher("/views/admin/video-list.jsp").forward(req, resp);
    }
}
