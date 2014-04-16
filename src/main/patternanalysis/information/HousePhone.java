package main.patternanalysis.information;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class HousePhone{

	public static void PatternAnalysis(String file) {
		// TODO Auto-generated method stub
		Pattern housephone = Pattern.compile("0[2-6]{1,2}[0-9-]{3,4}[0-9-]{3,4}|0[2-6]{1,2}\\s[0-9]{3,4}\\s[0-9]{3,4}|0[2-6]{1,2}[0-9]{3,4}[0-9]{3,4}");
		Matcher m = housephone.matcher(file);
		while(m.find()) System.out.println(m.group());
	}

}
