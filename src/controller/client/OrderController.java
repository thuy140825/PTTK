package controller.client;

import dao.CategoryDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.OrderDAO;
import dao.UserDAO;
import dao.impl.CategoryDAOImpl;
import dao.impl.OrderDAOImpl;
import dao.impl.UserDAOImpl;
import java.util.List;
import model.Category;
import model.Order;
import model.Customer;

@WebServlet("/order")
public class OrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private OrderDAO orderDao;
    public OrderController() {
        super();
        orderDao = new OrderDAOImpl();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CategoryDAO categoryDao = new CategoryDAOImpl();
		List<Category> categories = categoryDao.getAllCategories();
		request.setAttribute("categories", categories);
		HttpSession session = request.getSession();
		Order order = (Order) session.getAttribute("order"); // chi con truong hop truy cap truc tiep
		String userName = session.getAttribute("login_user").toString(); // filter loc user roi, nen neu co thi la da dang nhap
		UserDAO userDao = new UserDAOImpl();
		Customer user = userDao.getUserByUserName(userName);
		int id = 0; // order id, lay de in hoa don
		if(order == null) {
			response.sendRedirect("./"); // neu nguoi dung chua mua hang, ve trang chu
			return;
		}else {
			order.setUser(user);
			id = orderDao.addOrder(order);
		}
		session.removeAttribute("order"); // sau khi thanh cong, xoa session order di
		// dieu huong ve view hien thi
		//request.getRequestDispatcher("client/jsp/static/success.html").forward(request, response);
		response.sendRedirect("./success?id=" + id);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		
	}

}
