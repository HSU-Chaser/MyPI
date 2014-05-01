package main.search;

import java.io.Serializable;

public class SearchResult implements Serializable {
	private static final long serialVersionUID = 1L;
	String engine = null;
	String title = null;
	String url = null;
	String snippet = null;

	int resultNumber = 0; //결과 번호
	int exposure = 0; //노출도
	int reliability = 0; //신뢰도 

	public SearchResult(String engine, String title, String url,
			String snippet, int resultNumber) {
		this.engine = engine;
		this.title = title;
		this.url = url;
		this.snippet = snippet;
		this.resultNumber = resultNumber;
	}

	public int getExposure() {
		return exposure;
	}

	public void setExposure(int exposure) {
		this.exposure = exposure;
	}

	public int getReliability() {
		return reliability;
	}

	public void setReliability(int reliability) {
		this.reliability = reliability;
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
