package getDemo;

import org.junit.BeforeClass;
import org.junit.runner.RunWith;
import com.intuit.karate.junit4.Karate;

@RunWith(Karate.class)
public class UserRunner {
	
	@BeforeClass
	public static void before() {
		System.setProperty("karate.env", "dev");
	}

}
