package vn.edu.nlu.filter;

import vn.edu.nlu.fit.model.Users;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(filterName = "FilterUserLogin",urlPatterns = {"/Checkout","/UserProfile"})
public class FilterUserLogin implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;
        HttpSession session = request.getSession();
        Users users = (Users) session.getAttribute("user");
        String url = request.getContextPath()+request.getServletPath();
        if(users!=null&& users.getEmail()!=null){
            chain.doFilter(req, resp);
        }else{
            session.setAttribute("url",url);
            response.sendRedirect(request.getContextPath() + "/Login");
        }
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
