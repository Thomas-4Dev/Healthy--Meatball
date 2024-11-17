package controller.sync;

import dao.AccountDAO;
import model.Account;
import util.SecurityUtils;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class RegistrationController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            Account acc = (Account) session.getAttribute("LOGIN_USER");
            if (acc == null) {
                response.sendRedirect("registration.jsp");
            } else {
                if (acc.getRole() == 0) {
                    response.sendRedirect("user.jsp");
                } else if (acc.getRole() == 1) {
                    response.sendRedirect("admin.jsp");
                } else {
                    response.sendRedirect("HomeController");
                }
            }
            
        } catch (Exception e) {
            log("Error at RegistrationController: " + e.toString());
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String email = request.getParameter("email");
            
            AccountDAO dao = new AccountDAO();
            Account account = dao.getAccountInfoByEmail(email);
            if (account != null) {
                request.setAttribute("MSG_ERROR", "Tài khoản đã tồn tại trong hệ thống! Vui lòng sử dụng email này để đăng nhập.");
                request.setAttribute("email", email);
                request.getRequestDispatcher("registration.jsp").forward(request, response);
            } else {
                String name = request.getParameter("name");
                String phone = request.getParameter("phone");
                String password = SecurityUtils.hashMd5(request.getParameter("password"));
                boolean check = dao.insertAccount(email, password, name, phone, 1, 0);
                if (check) {
                    request.setAttribute("MSG_SUCCESS", "Bạn đã đăng ký tài khoản thành công!");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                }
            }
        } catch (Exception e) {
            log("Error at RegistrationController: " + e.toString());
        }
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
