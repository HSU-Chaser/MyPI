﻿package main.patternanalysis.information;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class ResidentNumber{
	public static List<String> residentList = new ArrayList<String>();
	
	public static void PatternAnalysis(String file) {
		// TODO Auto-generated method stub
		Pattern resident = Pattern.compile("[0-9]{2}(0[1-9]|1[012])(0[1-9]|1[0-9]|2[0-9]|3[01])-[012349][0-9]{6}|[0-9]{2}(0[1-9]|1[012])(0[1-9]|1[0-9]|2[0-9]|3[01])\\s[012349][0-9]{6}");
		Matcher m = resident.matcher(file);
		while(m.find())residentList.add(m.group());//System.out.println(m.group());
	}
	
}
