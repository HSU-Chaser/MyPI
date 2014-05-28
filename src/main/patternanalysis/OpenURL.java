package main.patternanalysis;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

public class OpenURL {
	private String url, buffer = "";
	FindPattern findpattern;

	public OpenURL(String url) {
		this.url = url;
	}

	public void urlRead() throws IOException {
		List<String> list = new ArrayList<String>();
		BufferedReader br = null;
		String blogFrame = null;
		boolean naverBlogCheck = false;

		try {
			InputStream inputURL = new URL(url).openStream();
			InputStreamReader rd = new InputStreamReader(inputURL, "UTF-8");
			br = new BufferedReader(rd);

			while ((buffer = br.readLine()) != null) {
				list.add(buffer);
				
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
				list.clear();
				BufferedReader brBlog = null;
				InputStream inputBlogURL = new URL(blogFrame).openStream();
				InputStreamReader rdBlog = new InputStreamReader(inputBlogURL,
						"MS949");
				brBlog = new BufferedReader(rdBlog);

				while ((buffer = brBlog.readLine()) != null) {

					list.add(buffer);
				}

				brBlog.close();
				naverBlogCheck = false;

			}
		} catch (Exception e) {
			System.err.println(e);
		}

		findpattern = new FindPattern(list);

		findpattern.find(); // find()로, 해당 리스트들의 각 메소드를 실행시켜 리스트를 다 만든다.

	}

}
