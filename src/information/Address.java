package information;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Address {
	public static List<String> addressList = new ArrayList<String>();
	public static void PatternAnalysis(String file) {
		// TODO Auto-generated method stub
		Pattern address = Pattern.compile("[가-힣]{2,5}\\s[가-힣]{2,5}[시구군읍]\\s[가-힣]{2,5}[구군읍면동]\\s[가-힣\\w]{2,10}\\s[가-힣\\w\\-\\s]{3,20}");
		Matcher m = address.matcher(file);
		while(m.find()) addressList.add(m.group());//System.out.println(m.group());
		}

}
