package information;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Email{
	public static List<String> emailList = new ArrayList<String>();
	public static void PatternAnalysis(String file) {
		// TODO Auto-generated method stub
		Pattern Email = Pattern.compile("[\\w\\~\\-\\.]+@[\\w\\~\\-]+(\\.[\\w\\~\\-]+)+");
		Matcher  m = Email.matcher(file);
		while(m.find()) emailList.add(m.group());//System.out.println(m.group());
	}
}
