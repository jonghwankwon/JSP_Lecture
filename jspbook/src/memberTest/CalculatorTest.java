package memberTest;

import static org.junit.Assert.assertEquals;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import member.Calculator;

public class CalculatorTest {
	/*private Calculator calc = new Calculator();*/// 객체생성 / 좋은방법x
	private Calculator calc = null;
	
	@Before //
	public void beforeTest() {
		calc = new Calculator();
		System.out.println("beforeTest()");
	}

	@Test //테스트 메세지임을 표시
	public void addTest() {
		assertEquals(30, calc.add(10, 20)); // 원하는 값과 result의 값이 같은지 확인
		System.out.println("addTest()");
	}
	
	@Test
	public void subTest() {
		assertEquals(-10, calc.sub(10, 20));
		System.out.println("subTest()");
	}

	@Test
	public void mulTest() {
		assertEquals(200, calc.mul(10, 20)); 
		System.out.println("mulTest()");
	}
	@Test
	public void divTest() {
		assertEquals(0.5, calc.div(10.0, 20.0), 0.00001); //오차범위 지정 0.00001
		System.out.println("divTest()");
	}
	
	@After //
	public void afterTest() {
		calc = new Calculator();
		System.out.println("afterTest()");
	}
	
	
}
