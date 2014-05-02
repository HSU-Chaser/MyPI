﻿package main.patternanalysis.information;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class HandPhone{
	
	public static void PatternAnalysis(String file) {
		// TODO Auto-generated method stub
		Pattern handphone = Pattern.compile("01[016789]+[\\d{3,4}]+[\\d{4}]|01[016789]+[-\\d{3,4}]+[-\\d{4}]|01[016789]+[.\\d{3,4}]+[.\\d{4}]"); //(\\d{3})(\\d{3,4})(\\d{4})
		Matcher m  = handphone.matcher(file);
		while(m.find()) System.out.println(m.group());		
	}
}