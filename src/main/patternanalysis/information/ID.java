package main.patternanalysis.information;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class ID {

	public static void PatternAnalysis(String file) {
		// TODO Auto-generated method stub
		String TextWithoutTag = file.replaceAll("<(/)?([a-zA-Z-_]*)(\\s[a-zA-Z-_]*=[^>]*)?(\\s)*(/)?>", "");
		Pattern Id = Pattern.compile("[\\w\\-\\_]{5,16}");
		Matcher m = Id.matcher(TextWithoutTag);

		
		
		
		// while(m.find()) System.out.println(m.group());
	}

}
