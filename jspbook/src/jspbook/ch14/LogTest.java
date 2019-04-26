package jspbook.ch14;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class LogTest {
	private static Logger LOG = LoggerFactory.getLogger(LogTest.class);
	
	// 메인 메소드에서 간단한 로그 메세지 처리 확인
	public static void main(String[] args) {
		String msg = "Hello Log!!";
		LOG.info("test log");
		LOG.warn("test log : {}", msg);
//		LOG.debug("debug level test");
//		LOG.trace("trace level test");
	}
}
