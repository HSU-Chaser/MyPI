package main.patternanalysis;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.ArrayList;

public class OpenURL {
	ArrayList<String> document = new ArrayList<String>();
	// public ArrayList<String> getUrlDocument() {
	// if (document == null) {
	// document = new ArrayList<String>();
	// }
	// return document;
	// }

	private String url, buffer = "";
	FindPattern findpattern;

	public OpenURL(String url) {
		this.url = url;
	}
	
	public void counting() {
		findpattern = new FindPattern();
		findpattern.countingProcess(document);
	}

	public void urlRead() throws IOException {
		BufferedReader br = null;
		String blogFrame = null;
		boolean naverBlogCheck = false;
		
		try {
			InputStream inputURL = new URL(url).openStream();
			InputStreamReader rd = new InputStreamReader(inputURL, "UTF-8");
			br = new BufferedReader(rd);

			while ((buffer = br.readLine()) != null) {
				document.add(buffer);

				if (buffer.contains("var eventCnt = ''")) {
					naverBlogCheck = true;
				}

				if ((naverBlogCheck == true) && (buffer.contains("mainFrame"))) {
					blogFrame = "http://blog.naver.com"
							+ buffer.replace('"', '@').split("@")[5];
				}
			}
			br.close();

			if (naverBlogCheck == true) {
				document.clear();
				BufferedReader brBlog = null;
				InputStream inputBlogURL = new URL(blogFrame).openStream();
				InputStreamReader rdBlog = new InputStreamReader(inputBlogURL,
						"MS949");
				brBlog = new BufferedReader(rdBlog);

				while ((buffer = brBlog.readLine()) != null) {

					document.add(buffer);
				}

				brBlog.close();
				naverBlogCheck = false;

			}
		} catch (Exception e) {
			System.err.println(e);
		}
	}
}
