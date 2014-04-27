package main.patternanalysis.information;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Hobby {
	public static void PatternAnalysis(String file) {
		// TODO Auto-generated method stub
		Pattern hobby = Pattern.compile("취미[\\s\\d-_:,.가-힣]{1,15}|취향[\\s-_:,.가-힣\\d]{1,15}"); 
		Matcher m  = hobby.matcher(file);
		while(m.find()) System.out.println(m.group());		
	}
}
