package Demo;

import org.testng.annotations.Test;

import io.restassured.response.Response;
import io.restassured.specification.RequestSpecification;

//import static io.restassured.response.ValidatableResponse;

import static io.restassured.RestAssured.*;
import static org.hamcrest.Matchers.*;
import static io.restassured.matcher.RestAssuredMatchers.*;
import java.util.HashMap;

public class RAHash {
	
	int id;
	
	@Test(priority = 1)
	void getUser() {
		
		given()
		
		.when()
		   .get("https://reqres.in/api/users?page=2")
		.then()
		.statusCode(200)
		.statusLine("HTTP/1.1 200 OK")
		.body("page", equalTo(2))
		.log().all();
	}
	
	@Test(priority = 2) 
	void createUser( ) {
		HashMap data = new HashMap();
		data.put("name", "Ruvaidha");
		data.put("Designation", "Software Engineer");
		
		id=given()
				.contentType("Application/json")
				.body(data)
			.when()
			.post("https://reqres.in/api/users")
			.jsonPath().getInt("id");	
	}
	
	@Test(priority = 1,dependsOnMethods = {"createUser"})
	void updateUser() {
		HashMap data = new HashMap();
		data.put("name", "Soqlaine");
		data.put("Desgnation", "Analyst");
		
		given()
		    .contentType("Application/json")
		    .body(data)
		.when()
		    .put("https://reqres.in/api/users/" +id)
		.then()
		    .statusCode(200)
		    .log().all();
	}
	
	@Test(priority = 4)
	void deleteUser() {
		given()
		
		.when()
		     .delete("https://reqres.in/api/users/" +id)
		.then()
		     .statusCode(204)
		     .log().all();
	}
}
