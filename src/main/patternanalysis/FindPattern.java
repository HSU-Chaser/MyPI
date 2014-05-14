package main.patternanalysis;

import java.util.ArrayList;
import java.util.List;

import main.patternanalysis.information.*;

public class FindPattern {
	public List<String> list = new ArrayList<String>();
	public FindPattern(List<String> list) {
		// TODO Auto-generated constructor stub
		this.list = list;
	}

	public void find(){
		System.out.println("주소 패턴");
		for(String outlist1 : list) Address.PatternAnalysis(outlist1);
		System.out.println("\n생년월일 패턴");
		for(String outlist2 : list) BirthDay.PatternAnalysis(outlist2);
		System.out.println("\n이메일 패턴");
		for(String outlist3 : list) Email.PatternAnalysis(outlist3);
		System.out.println("\n핸드폰 패턴");
		for(String outlist4 : list) HandPhone.PatternAnalysis(outlist4);
		System.out.println("\n집전화 패턴");
		for(String outlist5 : list) HousePhone.PatternAnalysis(outlist5);
		System.out.println("\nID 패턴");
		for(String outlist6 : list) ID.PatternAnalysis(outlist6);
		System.out.println("\n이름 패턴");
		for(String outlist7 : list) Name.PatternAnalysis(outlist7);
		System.out.println("\n주민등록번호 패턴");
		for(String outlist8 : list) ResidentNumber.PatternAnalysis(outlist8);
		System.out.println("\n학교 패턴");
		for(String outlist9 : list) School.PatternAnalysis(outlist9);
		System.out.println("\n취미 패턴");
		for(String outlist10 : list) Hobby.PatternAnalysis(outlist10);
	}
}
