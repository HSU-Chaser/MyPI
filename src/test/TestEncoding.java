package test;

import java.io.UnsupportedEncodingException;

public class TestEncoding {

	
	public static void main(String[] args){
		
		StringBuffer sb = new StringBuffer();
		byte b[];
		String charsetArray[] = { "euc-kr", "ksc5601", "iso-8859-1", "8859_1",
				"ascii", "utf-8" };
	
	
		sb.append("안녕하세요");
		sb.append("hello worlds");
		
		String st = sb.toString();
		System.out.println(st);
		try {
			
			for(int i=0; i<charsetArray.length; i++){
			
			b = st.getBytes();
			String s = new String(b, charsetArray[i]);
			
			System.out.println("현재 charset : " + charsetArray[i] + "  문자열 : " + s);
			}
			
			
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	
	
	
	}
}
