package main.search;

import java.io.Serializable;

public class SearchResult implements Serializable {
	private static final long serialVersionUID = 1L;
	String engine = null;
	String title = null;
	String url = null;
	String snippet = null;

	int resultNumber = 0; //결과 번호
	double exposure = 0; //노출도

	public SearchResult(String engine, String title, String url,
			String snippet, int resultNumber) {
		this.engine = engine;
		this.title = title;
		this.url = url;
		this.snippet = snippet;
		this.resultNumber = resultNumber;
	}

	public double getExposure() {
		return exposure;
	}

	public void setExposure(double exposure2) {
		this.exposure = exposure2;
	}

	public String getTitle() {
		return title;
	}

	public String getURL() {
		return url;
	}

	public String getSnippet() {
		return snippet;
	}

	public int getResultNumber() {
		return resultNumber;
	}

	public String getEngine() {
		return engine;
	}

}
