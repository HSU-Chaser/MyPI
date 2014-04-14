package search;

import java.io.Serializable;

public class SearchResult implements Serializable {
	private static final long serialVersionUID = 1L;
	
	String title = null;
	String link = null;
	String displayLink = null;
	String snippet = null;
	int resultNumber = 0;
	int exposure = 0;
	int reliability = 0;

	public SearchResult(String title, String link, String displayLink,
			String snippet, int resultNumber) {
		this.title = title;
		this.link = link;
		this.displayLink = displayLink;
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

	public String getLink() {
		return link;
	}

	public String getDisplayLink() {
		return displayLink;
	}

	public String getSnippet() {
		return snippet;
	}

	public int getResultNumber() {
		return resultNumber;
	}
}
