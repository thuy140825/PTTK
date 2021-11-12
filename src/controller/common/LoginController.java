package controller.common;

import dao.CategoryDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import dao.UserDAO;
import dao.impl.CategoryDAOImpl;
import dao.impl.UserDAOImpl;
import java.util.List;
import model.Category;
import util.Common;
import util.Constants;

@WebServlet(urlPatterns= {"/dang-nhap", "/login"})
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LoginController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
                CategoryDAO categoryDao = new CategoryDAOImpl();
		List<Category> categories = categoryDao.getAllCategories();
		request.setAttribute("categories", categories);
		request.getRequestDispatcher("/client/jsp/login.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		UserDAO userDao = new UserDAOImpl();
		boolean result = userDao.checkLoginInfo(username, Common.MD5(password));
		System.out.println(username + " " + password + " " + result);
		if(result == true) {
			HttpSession session = request.getSession();
			session.setAttribute("login_user", username);
			// dosfilter
			session.setAttribute("last_request", System.currentTimeMillis());
			
			// chuyen huong neu la admin
			if(userDao.getUserByUserName(username).getIsAdmin()== Constants.ADMIN_ROLE) {
				response.sendRedirect("admin/home");
				return;
			}
			
			response.sendRedirect("home");
		}
		else {
			request.setAttribute("errorMess", Constants.WRONG_USERNAME_OR_PASSWORD);
			request.getRequestDispatcher("/client/jsp/login.jsp").forward(request, response);
		}		
	}
}
