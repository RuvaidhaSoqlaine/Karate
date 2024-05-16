package Demo;

import org.json.JSONObject;
import org.testng.annotations.Test;

import static io.restassured.RestAssured.*;
import static org.hamcrest.Matchers.*;

import java.util.HashMap;

import static io.restassured.matcher.RestAssuredMatchers.*;

public class RAJson {
	// Approach 1
//	@Test 
//	void createUser( ) {
//		HashMap data = new HashMap();
//		data.put("name", "Ruvaidha");
//		data.put("Designation", "Software Engineer");
//		
//		given()
//				.contentType("Application/json")
//				.body(data)
//			.when()
//			.post("https://reqres.in/api/users")
//			
//		.then()
//		     .statusCode(201)
//		     .log().all();
//	}
	
	// Approach 2
	@Test 
	void createUserUsingJSON() {
		JSONObject js = new JSONObject();
		js.put("name", "Some One");
		js.put("specification", "Software Engineer");
		js.put("phone", "1010101010");
		String coursesArr[] = { "Java" , "Python" ,"C" , "C++" , "Kotlin"};
		js.put("Corses", coursesArr);
		
		given()
		     .contentType("application/json")
		     .body(js.toString())
		     
		.when()
		     .post("https://reqres.in/api/users")
		     
		 .then()
		      .statusCode(201)
		      .log().all();		
	}

}
