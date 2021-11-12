package filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDAO;
import dao.impl.UserDAOImpl;
import model.Customer;
import util.Constants;

/**
 * Servlet Filter implementation class AuthorFilter
 */
@WebFilter("/admin/*")
public class AuthorFilter implements Filter {

    public AuthorFilter() {
    }

    public void destroy() {
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        HttpSession session = req.getSession();
        if(session.getAttribute("login_user") == null) { // nếu chưa đăng nhập
                res.sendRedirect("/eshop/login");
        } else {
                UserDAO userDao = new UserDAOImpl();
                String username = session.getAttribute("login_user").toString();
                Customer user = userDao.getUserByUserName(username);
                if(user.getIsAdmin()== Constants.USER_ROLE) { // nếu đã đăng nhập và là user
                        res.sendRedirect("/eshop/home");
                } else chain.doFilter(request, response); // là admin
        }
    }

    public void init(FilterConfig fConfig) throws ServletException {
    }
}
