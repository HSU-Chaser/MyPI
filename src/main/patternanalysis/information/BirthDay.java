package main.patternanalysis.information;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class BirthDay {

	public static void PatternAnalysis(String file) {
		// TODO Auto-generated method stub
		Pattern birth = Pattern
				.compile("[0-9]{2}(0[1-9]|1[012])(0[1-9]|1[0-9]|2[0-9]|3[01])|19[0-9]{2}년\\s[0-9]{1,2}월"
						+ "\\s[0-9]{1,2}일 |20[0-9]{2}년\\s[0-9]{1,2}월\\s[0-9]{1,2}일|19[0-9]{2}년[0-9]{1,2}월[0-9]{1,2}일|20[0-9]{2}년\\s[0-9]{1,2}월\\s[0-9]{1,2}일|[0-9]{1,2}월\\s[0-9]{1,2}일|(0[1-9]|1[012])(0[1-9]|1[0-9]|2[0-9]|3[01])");
		Matcher m = birth.matcher(file);
		while (m.find())
			System.out.println(m.group());
	}

}
