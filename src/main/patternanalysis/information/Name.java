package main.patternanalysis.information;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Name {

	public static void PatternAnalysis(String file) {
		// TODO Auto-generated method stub
		// 한글이름 2글자~5글자
		Pattern name = Pattern
				.compile("[가-힣]{2,5}|[\\w\\-]{2,10}\\s[\\w\\-]{2,10}\\s[\\w\\-]{2,10}");
		// 영문이름 ex) si-young yang OR yang si-young OR siyoung yang OR yang
		// siyoung OR yang si young
		Matcher m = name.matcher(file);
		while (m.find())
			System.out.println(m.group());
	}

}