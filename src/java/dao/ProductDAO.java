package dao;

import util.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Product;

public class ProductDAO {

    private static final String GETPRODUCT = "SELECT pid, pName, price, imgPath, description, "
            + "status, cateId FROM Products WHERE pid = ?";
    private static final String GET_ALL_PRODUCTS = "SELECT pid, pName, price, imgPath, "
            + "description, status, cateId FROM Products";
    private static final String GET_TOP_4_PRODUCTS = "SELECT TOP(4) pid, pName, price, "
            + "imgPath, description, status, cateId FROM Products ORDER BY pid";
    private static final String GET_NEXT_4_PRODUCTS = "SELECT pid, pName, price, "
            + "imgPath, description, status, cateId \n"
            + "FROM Products ORDER BY pid OFFSET ? ROWS FETCH NEXT 4 ROWS ONLY";
    private static final String GET_TOP_4_PRODUCTS_BY_CATEGORY = "SELECT TOP(4) pid, "
            + "pName, price, imgPath, description, status, cateId FROM Products WHERE cateId = ? ORDER BY pid";
    private static final String GET_ALL_PRODUCTS_WITH_PAGING = "SELECT pid, pName, price, imgPath, description, status, cateId \n"
            + "FROM Products ORDER BY pid ASC OFFSET ((? - 1) * ?) ROW FETCH NEXT ? ROWS ONLY";
    private static final String GET_TOTAL_PRODUCTS = "SELECT COUNT(pid) AS total FROM Products";
    private static final String GET_PRODUCTS_BY_CATEGORY_WITH_PAGGING = "SELECT pId, pName, "
            + "price, imgPath, description, status, cateId FROM Products WHERE cateId = ? ORDER BY pId ASC "
            + "OFFSET ((? - 1) * ?) ROW FETCH NEXT ? ROWS ONLY";
    private static final String GET_TOTAL_PRODUCTS_BY_CATEGORY = "SELECT COUNT(pId) AS total FROM Products WHERE cateId = ?";
    private static final String UPDATE_PRODUCT_INFO = "UPDATE Products SET pName = ? , price = ? , imgPath = ?\n"
            + "      , description = ?, status = ?, cateId = ? WHERE pId = ?";
    private static final String INSERT_NEW_PRODUCT = "INSERT INTO Products (pName, price, imgPath, description, status, cateId) VALUES (?, ?, ?, ?, ?, ?)";
    private static final String GET_LIST_TOP_PRODUCTS_RANDOM = "SELECT TOP(?) * FROM Products WHERE cateId = ? ORDER BY NEWID()";
    private static final String GET_RANDOM_N_PRODUCTS = "SELECT TOP(?) * FROM Products ORDER BY NEWID()";
    
    
    
    public List<Product> getRandomNProducts(int quantity) throws SQLException {
        List<Product> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement psm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                psm = conn.prepareStatement(GET_RANDOM_N_PRODUCTS);
                psm.setInt(1, quantity);
                rs = psm.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int id = rs.getInt("pId");
                        String fullName = rs.getString("pName");
                        int price = rs.getInt("price");
                        String imgPath = rs.getString("imgPath");
                        String description = rs.getString("description");
                        int status = rs.getInt("status");
                        int cateId = rs.getInt("cateId");
                        Product product = new Product(id, fullName, price, imgPath, description, status, cateId);
                        list.add(product);
                    }
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (psm != null) {
                psm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }
    
    public List<Product> getListTopProductsRandom(int top, int cateId) throws SQLException {
        List<Product> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement psm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                psm = conn.prepareStatement(GET_LIST_TOP_PRODUCTS_RANDOM);
                psm.setInt(1, top);
                psm.setInt(2, cateId);
                rs = psm.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int id = rs.getInt("pId");
                        String fullName = rs.getString("pName");
                        int price = rs.getInt("price");
                        String imgPath = rs.getString("imgPath");
                        String description = rs.getString("description");
                        int status = rs.getInt("status");
                        Product product = new Product(id, fullName, price, imgPath, description, status, cateId);
                        list.add(product);
                    }
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (psm != null) {
                psm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }
    
    public boolean insertNewProduct(String name, String imgPath, int price, String description, int status, int cateId) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement psm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                psm = conn.prepareStatement(INSERT_NEW_PRODUCT);
                psm.setString(1, name);
                psm.setInt(2, price);
                psm.setString(3, imgPath);
                psm.setString(4, description);
                psm.setInt(5, status);
                psm.setInt(6, cateId);
                check = psm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
        } finally {
            if (psm != null) {
                psm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean updateProductInfo(int pid, String name, String imgPath, int price, String description, int status, int cateId) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement psm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                psm = conn.prepareStatement(UPDATE_PRODUCT_INFO);
                psm.setString(1, name);
                psm.setInt(2, price);
                psm.setString(3, imgPath);
                psm.setString(4, description);
                psm.setInt(5, status);
                psm.setInt(6, cateId);
                psm.setInt(7, pid);
                check = psm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
        } finally {
            if (psm != null) {
                psm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public int getTotalProductsByCategory(int category) throws SQLException {
        int total = 0;
        Connection conn = null;
        PreparedStatement psm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                psm = conn.prepareStatement(GET_TOTAL_PRODUCTS_BY_CATEGORY);
                psm.setInt(1, category);
                rs = psm.executeQuery();
                if (rs.next()) {
                    total = rs.getInt("total");
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (psm != null) {
                psm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return total;
    }

    public List<Product> getProductsByCategoryWithPagging(int category, int page, int PAGE_SIZE) throws SQLException {
        List<Product> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement psm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                psm = conn.prepareStatement(GET_PRODUCTS_BY_CATEGORY_WITH_PAGGING);
                psm.setInt(1, category);
                psm.setInt(2, page);
                psm.setInt(3, PAGE_SIZE);
                psm.setInt(4, PAGE_SIZE);
                rs = psm.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int id = rs.getInt("pId");
                        String fullName = rs.getString("pName");
                        int price = rs.getInt("price");
                        String imgPath = rs.getString("imgPath");
                        String description = rs.getString("description");
                        int status = rs.getInt("status");
                        int cateId = rs.getInt("cateId");
                        Product product = new Product(id, fullName, price, imgPath, description, status, cateId);
                        list.add(product);
                    }
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (psm != null) {
                psm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }

    public int getTotalProducts() throws SQLException {
        int total = 0;
        Connection conn = null;
        PreparedStatement psm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                psm = conn.prepareStatement(GET_TOTAL_PRODUCTS);
                rs = psm.executeQuery();
                if (rs.next()) {
                    total = rs.getInt("total");
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (psm != null) {
                psm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return total;
    }

    public List<Product> getAllProductsWithPaging(int page, int PAGE_SIZE) throws SQLException {
        List<Product> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement psm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                psm = conn.prepareStatement(GET_ALL_PRODUCTS_WITH_PAGING);
                psm.setInt(1, page);
                psm.setInt(2, PAGE_SIZE);
                psm.setInt(3, PAGE_SIZE);
                rs = psm.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int id = rs.getInt("PID");
                        String fullName = rs.getString("PName");
                        int price = rs.getInt("price");
                        String imgPath = rs.getString("imgPath");
                        String description = rs.getString("description");
                        int status = rs.getInt("status");
                        int cateId = rs.getInt("CateID");
                        Product product = new Product(id, fullName, price, imgPath, description, status, cateId);
                        list.add(product);
                    }
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (psm != null) {
                psm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }

    public int getTotalProductsFromSearchKeyword(String keyword, String searchby) throws SQLException {
        int total = 0;
        Connection conn = null;
        PreparedStatement psm = null;
        ResultSet rs = null;
        try {
            String getProducts = "SELECT COUNT(pid) AS total\n"
                    + "FROM Products P JOIN Categories C ON P.cateId = C.cateId ";
            conn = DBUtils.getConnection();
            if (conn != null) {
                if (searchby.equalsIgnoreCase("byname")) {
                    getProducts += "WHERE pName LIKE ?";
                } else {
                    getProducts += "WHERE cateName LIKE ?";
                }
                psm = conn.prepareStatement(getProducts);
                psm.setString(1, "%" + keyword + "%");
                rs = psm.executeQuery();
                if (rs.next()) {
                    total = rs.getInt("total");
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (psm != null) {
                psm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return total;
    }

    public List<Product> getSearchProductsWithPaging(String keyword, String searchby, int page, int PAGE_SIZE) throws SQLException {
        List<Product> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement psm = null;
        ResultSet rs = null;
        try {
            String getProducts = "SELECT pid, pName, price, imgPath, description, status, P.cateId \n"
                    + "FROM Products P JOIN Categories C ON P.cateId = C.cateId ";
            conn = DBUtils.getConnection();
            if (conn != null) {
                if (searchby.equalsIgnoreCase("byname")) {
                    getProducts += "WHERE pName LIKE ? ORDER BY pid ASC OFFSET ((? - 1) * ?) ROW FETCH NEXT ? ROWS ONLY";
                } else {
                    getProducts += "WHERE cateName LIKE ? ORDER BY pid ASC OFFSET ((? - 1) * ?) ROW FETCH NEXT ? ROWS ONLY";
                }
                psm = conn.prepareStatement(getProducts);
                psm.setString(1, "%" + keyword + "%");
                psm.setInt(2, page);
                psm.setInt(3, PAGE_SIZE);
                psm.setInt(4, PAGE_SIZE);
                rs = psm.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int id = rs.getInt("PID");
                        String fullName = rs.getString("PName");
                        int price = rs.getInt("price");
                        String imgPath = rs.getString("imgPath");
                        String description = rs.getString("description");
                        int status = rs.getInt("status");
                        int cateId = rs.getInt("CateID");
                        Product product = new Product(id, fullName, price, imgPath, description, status, cateId);
                        list.add(product);
                    }
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (psm != null) {
                psm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }

    public List<Product> getTop4ProductsByCateId(int cateId) throws SQLException {
        List<Product> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement psm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                psm = conn.prepareStatement(GET_TOP_4_PRODUCTS_BY_CATEGORY);
                psm.setInt(1, cateId);
                rs = psm.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int id = rs.getInt("PID");
                        String fullName = rs.getString("PName");
                        int price = rs.getInt("price");
                        String imgPath = rs.getString("imgPath");
                        String description = rs.getString("description");
                        int status = rs.getInt("status");
                        Product product = new Product(id, fullName, price, imgPath, description, status, cateId);
                        list.add(product);
                    }
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (psm != null) {
                psm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }

    public List<Product> getNext4Products(int amount) throws SQLException {
        List<Product> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement psm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                psm = conn.prepareStatement(GET_NEXT_4_PRODUCTS);
                psm.setInt(1, amount);
                rs = psm.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int id = rs.getInt("PID");
                        String fullName = rs.getString("PName");
                        int price = rs.getInt("price");
                        String imgPath = rs.getString("imgPath");
                        String description = rs.getString("description");
                        int status = rs.getInt("status");
                        int cateId = rs.getInt("CateID");
                        Product product = new Product(id, fullName, price, imgPath, description, status, cateId);
                        list.add(product);
                    }
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (psm != null) {
                psm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }

    public List<Product> getTop4Products() throws SQLException {
        List<Product> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement psm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                psm = conn.prepareStatement(GET_TOP_4_PRODUCTS);
                rs = psm.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int id = rs.getInt("PID");
                        String fullName = rs.getString("PName");
                        int price = rs.getInt("price");
                        String imgPath = rs.getString("imgPath");
                        String description = rs.getString("description");
                        int status = rs.getInt("status");
                        int cateId = rs.getInt("CateID");
                        Product product = new Product(id, fullName, price, imgPath, description, status, cateId);
                        list.add(product);
                    }
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (psm != null) {
                psm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }

    public Product getProduct(int pid) throws SQLException {
        Product product = null;
        Connection conn = null;
        PreparedStatement psm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                psm = conn.prepareStatement(GETPRODUCT);
                psm.setInt(1, pid);
                rs = psm.executeQuery();
                if (rs.next()) {
                    product = new Product(rs.getInt("PID"), rs.getString("PName"),
                            rs.getInt("price"), rs.getString("imgPath"),
                            rs.getString("description"), rs.getInt("status"),
                            rs.getInt("CateID"));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (psm != null) {
                psm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return product;
    }

    public List<Product> getProducts(String keyword, String searchby) throws SQLException {
        List<Product> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement psm = null;
        ResultSet rs = null;
        try {
            String getProducts = "SELECT pid, pName, price, imgPath, description, status, P.cateId \n"
                    + "FROM Products P JOIN Categories C ON P.cateId = C.cateId ";
            conn = DBUtils.getConnection();
            if (conn != null) {
                if (searchby.equalsIgnoreCase("byname")) {
                    getProducts += "WHERE pName like ?";
                } else {
                    getProducts += "WHERE cateName like ?";
                }
                psm = conn.prepareStatement(getProducts);
                psm.setString(1, "%" + keyword + "%");
                rs = psm.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int id = rs.getInt("PID");
                        String fullName = rs.getString("PName");
                        int price = rs.getInt("price");
                        String imgPath = rs.getString("imgPath");
                        String description = rs.getString("description");
                        int status = rs.getInt("status");
                        int cateId = rs.getInt("CateID");
                        Product product = new Product(id, fullName, price, imgPath, description, status, cateId);
                        list.add(product);
                    }
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (psm != null) {
                psm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }

    public List<Product> getAllProducts() throws SQLException {
        List<Product> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement psm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                psm = conn.prepareStatement(GET_ALL_PRODUCTS);
                rs = psm.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int id = rs.getInt("PID");
                        String fullName = rs.getString("PName");
                        int price = rs.getInt("price");
                        String imgPath = rs.getString("imgPath");
                        String description = rs.getString("description");
                        int status = rs.getInt("status");
                        int cateId = rs.getInt("CateID");
                        Product product = new Product(id, fullName, price, imgPath, description, status, cateId);
                        list.add(product);
                    }
                }
            }
        } catch (Exception e) {
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (psm != null) {
                psm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }

}
