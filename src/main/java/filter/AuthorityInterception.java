package filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class AuthorityInterception implements Filter {
    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse,
                         FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest)servletRequest;
        HttpServletResponse response = (HttpServletResponse)servletResponse;
        String userName = (String) request.getSession().getAttribute("userName");
        if(userName != null){
            filterChain.doFilter(servletRequest,servletResponse);
        }else {
            response.sendRedirect("/index.jsp");
        }
    }
}