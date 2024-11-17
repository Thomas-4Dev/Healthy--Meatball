package controller.sync;

import dao.ProductDAO;
import model.Product;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ViewAllController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            final int PAGE_SIZE = 9;
            
            HttpSession session = request.getSession();
            session.setAttribute("destPage", "product");
            
            String category = request.getParameter("category");
            String pagenumber = request.getParameter("pagenumber");
            int page = 1;
            if (pagenumber != null) {
                page = Integer.parseInt(pagenumber);
            }

            ProductDAO dao = new ProductDAO();
            if (category == null || category.isEmpty()) {
                List<Product> listProducts = dao.getAllProductsWithPaging(page, PAGE_SIZE);
                int totalProducts = dao.getTotalProducts();
                int totalPage = totalProducts / PAGE_SIZE;
                if (totalProducts % PAGE_SIZE != 0) {
                    totalPage += 1;
                }
                request.setAttribute("page", page);
                request.setAttribute("totalPage", totalPage);
                request.setAttribute("listProducts", listProducts);
                session.setAttribute("urlHistory", "ViewAllController"
                                                 + ((pagenumber != null) ? ("?pagenumber=" + pagenumber) : ""));
                request.getRequestDispatcher("product.jsp").forward(request, response);
            } else {
                List<Product> listProducts = dao.getProductsByCategoryWithPagging(Integer.parseInt(category), page, PAGE_SIZE);
                if (!listProducts.isEmpty()) {
                    int totalProducts = dao.getTotalProductsByCategory(Integer.parseInt(category));
                    int totalPage = totalProducts / PAGE_SIZE;
                    if (totalProducts % PAGE_SIZE != 0) {
                        totalPage += 1;
                    }
                    request.setAttribute("page", page);
                    request.setAttribute("totalPage", totalPage);
                    request.setAttribute("category", category);
                    request.setAttribute("listProducts", listProducts);
                    session.setAttribute("urlHistory", "ViewAllController?category=" + category
                                                 + ((pagenumber != null) ? ("&pagenumber=" + pagenumber) : ""));
                    request.getRequestDispatcher("product.jsp").forward(request, response);
                } else {
                    request.setAttribute("category", category);
                    request.setAttribute("NO_PRODUCT", "There are currently no products in this category");
                    session.setAttribute("urlHistory", "ViewAllController?category=" + category);
                    request.getRequestDispatcher("product.jsp").forward(request, response);
                }
            }
        } catch (Exception e) {
            log("Error at ViewAllController: " + e.toString());
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