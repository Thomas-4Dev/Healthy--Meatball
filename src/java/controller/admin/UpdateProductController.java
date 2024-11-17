package controller.admin;

import dao.ProductDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UpdateProductController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Đặt mã hóa ký tự cho yêu cầu và phản hồi để hỗ trợ tiếng Việt
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        
        try {
            String action = request.getParameter("action");
            if (action != null) {
                String name = request.getParameter("name");
                String imgPath = request.getParameter("imgPath");
                int price = Integer.parseInt(request.getParameter("price"));
                String description = request.getParameter("description");
                int status = Integer.parseInt(request.getParameter("status"));
                int cateId = Integer.parseInt(request.getParameter("cateId"));
                switch (action) {
                    case "updateProduct":
                        int pid = Integer.parseInt(request.getParameter("pid"));
                        boolean check1 = new ProductDAO().updateProductInfo(pid, name, imgPath, price, description, status, cateId);
                        if (check1) {
                            request.setAttribute("MSG_SUCCESS", "Bạn đã cập nhật thành công thông tin!");
                        } else {
                            request.setAttribute("MSG_ERROR", "Bạn đã cập nhật thông tin thất bại!");
                        }
                        break;
                    case "createProduct":
                        boolean check2 = new ProductDAO().insertNewProduct(name, imgPath, price, description, status, cateId);
                        if (check2) {
                            request.setAttribute("MSG_SUCCESS", "Bạn đã tạo thành công sản phẩm mới!");
                        } else {
                            request.setAttribute("MSG_ERROR", "Tạo sản phẩm thất bại!");
                        }
                        break;
                }
            } else {
                request.setAttribute("MSG_ERROR", "Có lỗi xảy ra. Vui lòng thử lại!");
            }
        } catch (Exception e) {
            log("Error at UpdateProductController: " + e.toString());
        } finally {
            request.getRequestDispatcher("AdminManageProductController").forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Đặt mã hóa ký tự cho yêu cầu và phản hồi để hỗ trợ tiếng Việt
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Đặt mã hóa ký tự cho yêu cầu và phản hồi để hỗ trợ tiếng Việt
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
