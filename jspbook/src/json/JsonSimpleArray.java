package json;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

public class JsonSimpleArray {
	public static void main(String[] args) {
		//JSON Data 는 가장 아래 단계에서 부터 만들어 나간다.
		System.out.println("-------------------------------------------");
		System.out.println("JSON string 생성");
		JSONObject jObj = new JSONObject();

		JSONArray jArray = new JSONArray();
		jArray.add("국어");
		jArray.add("math");
		jArray.add("english");
		jObj.put("subject", jArray);

		System.out.println(jObj.toString());

		System.out.println("-------------------------------------------");
		System.out.println("JSON string 파싱");
		try {	//파싱은 예외처리가 필요
			JSONArray rSub = (JSONArray) jObj.get("subject");	//받아들일 때 age라는 키값으로 받는다.
			String name = (String) jObj.get("name");//받을 때 상호 형식이 맞아야한다. age = Integer / String = name
			System.out.println("size = " + rSub.size());
			for (int i=0; i<rSub.size(); i++) {
				System.out.println("subject["+ i + "] :" + (String)rSub.get(i));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("-------------------------------------------");

	}
}
