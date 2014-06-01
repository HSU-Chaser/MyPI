package main.patternanalysis;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;

public class OpenURL {

	ArrayList<String> document = new ArrayList<String>();

	public String originUrl, buffer = "";

	KeywordCounting findpattern;

	public OpenURL(String originUrl) {
		this.originUrl = originUrl;
	}

	public RankingCount counting() {
		findpattern = new KeywordCounting();
		return findpattern.countingProcess(document);
	}

	public void urlRead() throws IOException {
		String charset = ""; // charset finding
		boolean check = false;
		BufferedReader brChar, br = null;
		String charsetArray[] = { "euc-kr", "ksc5601", "iso-8859-1", "8859_1",
				"ascii", "utf-8" };
		String charsetArrayBig[] = new String[charsetArray.length];

		for (int i = 0; i < charsetArrayBig.length; i++) {
			charsetArrayBig[i] = charsetArray[i].toUpperCase();
			System.out.println(charsetArrayBig[i]);
		}

		try {
			URL url = new URL(originUrl);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();

			con.addRequestProperty("User-Agent", "Mozilla/4.0");
			con.setConnectTimeout(5000);
			con.setReadTimeout(3000);

			InputStream inputURL = con.getInputStream();
			InputStreamReader rdChar, rd = null;
			// if (originUrl.contains("blog.naver.com")) {
			// rd = new InputStreamReader(inputURL, "MS949");
			// } else {
			// rd = new InputStreamReader(inputURL, "UTF-8");
			// }

			rdChar = new InputStreamReader(inputURL, "UTF-8");

			brChar = new BufferedReader(rdChar);

			while ((buffer = brChar.readLine()) != null) {
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

			rd = new InputStreamReader(inputURL, charset);
			br = new BufferedReader(rd);

			while ((buffer = br.readLine()) != null) {
				document.add(buffer);
			}

			
			rdChar.close();
			brChar.close();
			rd.close();
			br.close();

		} catch (Exception e) {
			System.err.println(e);
		}

		System.out.println(originUrl + " 분석 끝.");
	}
}
