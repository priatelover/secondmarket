package cn.gok.secondMarket.listener;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class UserOnlineCountListener implements ServletContextListener {
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        ServletContext servletContext = sce.getServletContext();
        servletContext.setAttribute("count",0);
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {

    }
}
