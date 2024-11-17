package controller.admin;

import dao.AccountDAO;
import model.Account;
import util.SecurityUtils;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AdminInfoController extends HttpServlet {
    
    private static final String ADMIN_PAGE = "admininfo.jsp";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            response.sendRedirect(ADMIN_PAGE);
        } catch (Exception e) {
            log("Error at AdminInfo: " + e.toString());
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            Account acc = (Account) session.getAttribute("LOGIN_USER");
            AccountDAO accDAO = new AccountDAO();
            if (acc != null) {
                String action = request.getParameter("action");
                if (action != null) {
                    switch (action) {
                        case "updateInfo":
                            String name = request.getParameter("name");
                            String phone = request.getParameter("phone");
                            boolean check = accDAO.changeAccount(acc.getEmail(), name, phone);
                            if (check) {
                                acc = accDAO.getAccountInfoByEmail(acc.getEmail());
                                session.setAttribute("LOGIN_USER", acc);
                                request.setAttribute("MSG_SUCCESS", "Cập nhật thông tin hồ sơ thành công!");
                                request.getRequestDispatcher(ADMIN_PAGE).forward(request, response);
                            } else {
                                request.setAttribute("MSG_ERROR", "Có lỗi xảy ra. Vui lòng thử lại!");
                                request.getRequestDispatcher(ADMIN_PAGE).forward(request, response);
                            }
                            break;
                        case "changePassword":
                            String oldPassword = SecurityUtils.hashMd5(request.getParameter("oldPassword"));
                            boolean checkOldPsw = accDAO.checkOldPassword(acc.getAccId(), oldPassword);
                            if (checkOldPsw) {
                                String newPasword = SecurityUtils.hashMd5(request.getParameter("newPassword"));
                                boolean checkNewPsw = accDAO.updateAccountPassword(acc.getAccId(), newPasword);
                                if (checkNewPsw) {
                                    request.setAttribute("MSG_SUCCESS", "Đổi mật khẩu thành công!");
                                    request.getRequestDispatcher(ADMIN_PAGE).forward(request, response);
                                } else {
                                    request.setAttribute("MSG_ERROR", "Có lỗi xảy ra. Vui lòng thử lại!");
                                    request.getRequestDispatcher(ADMIN_PAGE).forward(request, response);
                                }
                            } else {
                                request.setAttribute("MSG_ERROR", "Bạn nhập sai mật khẩu cũ! Vui lòng thử lại!");
                                request.getRequestDispatcher(ADMIN_PAGE).forward(request, response);
                            }
                            break;
                    }
                } else {
                    request.setAttribute("MSG_ERROR", "Có lỗi xảy ra. Vui lòng thử lại!");
                    request.getRequestDispatcher("invalid.jsp").forward(request, response);
                }
            } else {
            }
        } catch (Exception e) {
            log("Error at AdminInfoController: " + e.toString());
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
