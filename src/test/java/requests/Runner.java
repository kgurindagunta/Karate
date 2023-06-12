package requests;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class Runner {

	@Test
	public Karate run() {
		return Karate.run("sample").relativeTo(getClass());
	}

}
