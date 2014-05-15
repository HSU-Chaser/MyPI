package main.patternanalysis;

import java.io.*;
import java.net.URL;
import java.util.*;

public class OpenURL {
	private String url, buffer = "";
	FindPattern findpattern;

	public OpenURL(String url) {
		this.url = url;
	}

	public void Reader() throws IOException {
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
		findpattern.find();
	}

}
