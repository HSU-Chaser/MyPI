package main.patternanalysis;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.ArrayList;

public class OpenURL {

	private static ArrayList<String> document;

	public ArrayList<String> getUrlDocument() {

		if (document == null) {
			document = new ArrayList<String>();
		}
		return document;
	}

	private String url, buffer = "";
	FindPattern findpattern;

	public OpenURL(String url) {
		this.url = url;
	}

	public void urlRead() throws IOException {

		BufferedReader br = null;
		InputStreamReader rd = null;
		try {
			InputStream inputURL = new URL(url).openStream();
			if (url.contains("blog.naver.com")) {
				System.out.println("블로그 들어와서 읽고있땅께");
				rd = new InputStreamReader(inputURL, "MS949");
			} else {
				rd = new InputStreamReader(inputURL, "UTF-8");
			}

			br = new BufferedReader(rd);

			while ((buffer = br.readLine()) != null) {

				getUrlDocument().add(buffer);

			}

			br.close();

		} catch (Exception e) {
			System.err.println(e);
		}

		findpattern = new FindPattern(getUrlDocument());

		findpattern.countingProcess(); // find()로, 해당 리스트들의 각 메소드를 실행시켜 리스트를 다
										// 만든다.

	}

}
