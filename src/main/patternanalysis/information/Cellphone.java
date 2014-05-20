package main.patternanalysis.information;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import main.patternanalysis.RankingCount;

public class Cellphone{

	public static void PatternAnalysis(String file) {
		/* 
		 * 핸드폰 중간자리가 3자리일때 011경우 200~899까지 4자리일때 1700~1799,9500~9999
		 * 핸드폰 중간자리가 3자리일때 016경우 200~899까지 4자리일때 9000~9499           
		 * 핸드폰 중간자리가 3자리일때 019경우 200~899까지 4자리일때 9000~9999
		 * 010번호인경우 중간자리는 무조건 4자리이고 2000~9999까지 
		 "011-[2-8][0-9]{2}-[0-9]{4}|"
		 "011[2-8][0-9]{2}[0-9]{4}|"
		 "011-(1|9)(7|[5-9])[0-9]{2}-[0-9]{4}|"
		 "011(1|9)(7|[5-9])[0-9]{2}[0-9]{4}|"
		 "016-[2-8][0-9]{2}-[0-9]{4}|"
		 "016[2-8][0-9]{2}[0-9]{4}|"
		 "016-9[0-4][0-9]{2}-[0-9]{4}|"
		 "0169[0-4][0-9]{2}[0-9]{4}|"
		 "019-[2-8][0-9]{2}-[0-9]{4}|"
		 "019[2-8][0-9]{2}[0-9]{4}|"
		 "019-9[0-9]{3}-[0-9]{4}|"
		 "0199[0-9]{3}[0-9]{4}|"
		 */
		Pattern cellphone = Pattern.compile("010-[2-9][0-9]{3}-[0-9]{3,4}|010[2-9][0-9]{3}[0-9]{3,4}");
		Matcher m  = cellphone.matcher(file);
		
		while(m.find()) {
			
			RankingCount.cellphoneList.add(m.group()); //System.out.println(m.group());		
		
		}
	}
}
