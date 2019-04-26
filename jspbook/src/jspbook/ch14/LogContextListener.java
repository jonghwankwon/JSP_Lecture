package jspbook.ch14;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import org.slf4j.*;

@WebListener
public class LogContextListener implements ServletContextListener{
	Logger log;

	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		log.info("LogContextListener stop");
	}

	@Override
	public void contextInitialized(ServletContextEvent arg0) {
		log = LoggerFactory.getLogger(this.getClass());
		log.info("LogContextListener start");
	}
	
}
