package json;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

public class JsonMix {	//JsonObject.java + JsonArray.java
	public static void main(String[] args) {
		//JSON Data 는 가장 아래 단계에서 부터 만들어 나간다.
		System.out.println("-------------------------------------------");
		System.out.println("JSON string 생성");
		JSONObject jObj = new JSONObject();
		jObj.put("name", "홍길동");	
		jObj.put("age", 40);		

		JSONArray jArray = new JSONArray();
		JSONObject school = new JSONObject();
		jArray.add(school);
		school.put("subject", "math");
		
		school = new JSONObject();	//다른 값을 추가할 땐 object를 새로 생성
		school.put("subject", "국어");
		jArray.add(school);
		jObj.put("school", jArray);

		System.out.println(jObj.toString());

		System.out.println("-------------------------------------------");
		System.out.println("JSON string 파싱");
		try {	//파싱은 예외처리가 필요
			JSONArray returnSchool = (JSONArray) jObj.get("school");
			System.out.println("size = " + returnSchool.size());
			for (int i=0; i<returnSchool.size(); i++) {
				JSONObject returnSubject = (JSONObject) returnSchool.get(i);
				System.out.println("subject : " + returnSubject.get("subject"));
			}
			int age = (Integer) jObj.get("age");	
			String name = (String) jObj.get("name");
			System.out.println("name = " + name);
			System.out.println("age = " + age);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("-------------------------------------------");
	}
}
