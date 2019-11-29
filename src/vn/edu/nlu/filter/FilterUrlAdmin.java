package vn.edu.nlu.filter;

import vn.edu.nlu.fit.model.Users;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(filterName = "FilterUrlAdmin",urlPatterns = {"/Admin/*"})
public class FilterUrlAdmin implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;
        if(request.getServletPath().contains("/Admin/Login")){
            chain.doFilter(req, resp);
            return;
        }
        HttpSession session = request.getSession();
        Users admin = (Users) session.getAttribute("admin");
        if(admin==null||admin.getEmail()==null||admin.getPassword()==null){
            response.sendRedirect(request.getContextPath()+"/Admin/Login");
        }else {
            chain.doFilter(req, resp);
        }
    }

    public void init(FilterConfig config) throws ServletException {
    }

}
