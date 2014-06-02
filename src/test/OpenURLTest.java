package test;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import main.patternanalysis.KeywordCounting;
import main.patternanalysis.RankingCount;

public class OpenURLTest {

	static StringBuffer document = new StringBuffer();

	public static String originUrl = "http://blog.naver.com/PostView.nhn?blogId=tera16&logNo=204543437";
	public static String buffer = "";

	public static void urlRead() throws IOException {
		String charset = ""; // charset finding
		boolean check = false;
		BufferedReader brChar, br = null;
		String charsetArray[] = { "euc-kr", "ksc5601", "iso-8859-1", "8859_1", "ms949",
				"ascii", "utf-8" };
		String charsetArrayBig[] = new String[charsetArray.length];

		for (int i = 0; i < charsetArrayBig.length; i++) {
			charsetArrayBig[i] = charsetArray[i].toUpperCase();
		}

		try {
			URL urlChar = new URL(originUrl);
			HttpURLConnection conChar = (HttpURLConnection) urlChar.openConnection();

			conChar.addRequestProperty("User-Agent", "Mozilla/4.0");
			conChar.setConnectTimeout(5000);
			conChar.setReadTimeout(3000);

			InputStream inputURLChar = conChar.getInputStream();
			InputStreamReader rdChar = null;

			rdChar = new InputStreamReader(inputURLChar, "UTF-8");

			brChar = new BufferedReader(rdChar);

			while ((buffer = brChar.readLine()) != null) {
				System.out.println("Test : " + buffer);
				if (buffer.contains("charset")) {
					charset = buffer.split("charset=")[1].replace('"', '@')
							.split("@")[0];
					System.out.println("현재 사이트의 케릭터 셋 : " + charset);
					break;
				}
			}

			for (int i = 0; i < charsetArray.length; i++) {

				if (charset.equals(charsetArray[i])) {
					check = true;
				}

			}
			for (int i = 0; i < charsetArrayBig.length; i++) {

				if (charset.equals(charsetArrayBig[i])) {
					check = true;
				}
			}

			if (check == false) {
				charset = "UTF-8";
			}

			rdChar.close();
			brChar.close();


		} catch (Exception e) {
			System.err.println(e);
		}

		try {
			URL url = new URL(originUrl);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();

			con.addRequestProperty("User-Agent", "Mozilla/4.0");
			con.setConnectTimeout(5000);
			con.setReadTimeout(3000);

			InputStream inputURL = con.getInputStream();
			InputStreamReader rd = null;


			rd = new InputStreamReader(inputURL, charset);
			br = new BufferedReader(rd);

			while ((buffer = br.readLine()) != null) {
				document.append(buffer);
				System.out.println(buffer);
				if(buffer.contains("테라바이트")){
					break;
				}
			}

			rd.close();
			br.close();

		} catch (Exception e) {
			System.err.println(e);
		}

		System.out.println(originUrl + " 분석 끝.");
	}

	public static void main(String[] args) {

		try {
			urlRead();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
