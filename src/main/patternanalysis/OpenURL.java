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
	
	FindPattern findpattern;

	public OpenURL(String originUrl) {
		this.originUrl = originUrl;
	}
	
	public void counting() {
		findpattern = new FindPattern();
		findpattern.countingProcess(document);
	}

	public void urlRead() throws IOException {
		BufferedReader br = null;
		
		try {
			URL url = new URL(originUrl);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();

			con.addRequestProperty("User-Agent", "Mozilla/4.0");
			con.setConnectTimeout(5000);
			con.setReadTimeout(3000);
			
			InputStream inputURL = con.getInputStream();
			InputStreamReader rd; 
			if (originUrl.contains("blog.naver.com")) {
				rd = new InputStreamReader(inputURL, "MS949");
			} else {
				rd = new InputStreamReader(inputURL, "UTF-8");
			}
			
			br = new BufferedReader(rd);

			while ((buffer = br.readLine()) != null) {
				document.add(buffer);
			}
			br.close();

		} catch (Exception e) {
			System.err.println(e);
		}
		
		System.out.println(originUrl + " 분석 끝.");
	}
}
