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

		try {
			InputStream InputURL = new URL(url).openStream();
			InputStreamReader rd = new InputStreamReader(InputURL, "UTF-8");
			br = new BufferedReader(rd);

			while ((buffer = br.readLine()) != null) {
				list.add(buffer);
			}

			br.close();
		} catch (Exception e) {
			System.err.println(e);
		}
		findpattern = new FindPattern(list);
		
		findpattern.find(); // find()로, 해당 리스트들의 각 메소드를 실행시켜 리스트를 다 만든다.
		
		
	}

}
