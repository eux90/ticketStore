import myTypes.User;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by eugeniosorbellini on 09/04/17.
 */
@WebFilter(filterName = "LoginFilter", urlPatterns = {"/private/*"})
public class LoginFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        //System.out.println("inside filter");
        HttpSession s = ((HttpServletRequest)req).getSession();
        User user = (User)s.getAttribute("user");
        if(user.getName().equals("none") || user.getSurname().equals("none")){
            //redirect to login
            ((HttpServletResponse) resp).sendRedirect("/login.jsp");
        }else{
            // pass the request along the filter chain
            chain.doFilter(req, resp);
        }
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
