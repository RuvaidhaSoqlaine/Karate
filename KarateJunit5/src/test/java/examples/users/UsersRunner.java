package examples.users;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

class UsersRunner {
    
	
    @Karate.Test
    Karate testcase() {
    	System.setProperty("karate.env", "qa");
    	return Karate.run("Delete").relativeTo(getClass());
    }

}
