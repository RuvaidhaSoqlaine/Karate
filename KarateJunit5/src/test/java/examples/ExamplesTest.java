package examples;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;

class ExamplesTest {

    @Test
    void testParallel() {
    	System.setProperty("karate.env", "qa");
        Results results = Runner.path("classpath:examples").tags("Get1,Post1,ParamsPost,Output,Output2,Put1,ResponsePut,Response1Put,Delete,Get2,Get3,Get4,Output1,parse")
                //.outputCucumberJson(true)
                .parallel(5);
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }

}
