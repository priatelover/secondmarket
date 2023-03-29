package cn.gok.secondMarket.listener;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

public class UserLoginListener implements HttpSessionListener {
    @Override
    public void sessionCreated(HttpSessionEvent se) {
        ServletContext servletContext = se.getSession().getServletContext();
        Integer count = (Integer) servletContext.getAttribute("count");
        servletContext.setAttribute("count",++count);
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
        ServletContext servletContext = se.getSession().getServletContext();
        Integer count = (Integer) servletContext.getAttribute("count");
        servletContext.setAttribute("count",--count);
    }
}
