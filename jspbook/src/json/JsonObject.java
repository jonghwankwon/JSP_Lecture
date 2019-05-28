package json;

import org.json.simple.JSONObject;

public class JsonObject {
	public static void main(String[] args) {
		//JSON Data 는 가장 아래 단계에서 부터 만들어 나간다.
		System.out.println("-------------------------------------------");
		System.out.println("JSON string 생성");
		JSONObject jObj = new JSONObject();
		jObj.put("name", "홍길동");	// String name = "홍길동";
		jObj.put("age", 40);		// int age = 40;
		
		System.out.println(jObj.toString());
		
		System.out.println("-------------------------------------------");
		System.out.println("JSON string 파싱");
		try {	//파싱은 예외처리가 필요
			int age = (Integer) jObj.get("age");	//받아들일 때 age라는 키값으로 받는다.
			String name = (String) jObj.get("name");//받을 때 상호 형식이 맞아야한다. age = Integer / String = name
			System.out.println("name = " + name);
			System.out.println("age = " + age);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("-------------------------------------------");
		
	}
}
