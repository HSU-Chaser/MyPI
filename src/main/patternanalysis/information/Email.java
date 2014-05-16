package main.patternanalysis.information;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import main.patternanalysis.InfoStorage;

public class Email{

	public static void PatternAnalysis(String file) {
		// TODO Auto-generated method stub
		Pattern Email = Pattern.compile("[\\w\\~\\-\\.]+@[\\w\\~\\-]+(\\.[\\w\\~\\-]+)+");
		Matcher  m = Email.matcher(file);
		while(m.find()) InfoStorage.emailList.add(m.group());//System.out.println(m.group());
	}
}
