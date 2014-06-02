package main.search;

import java.io.IOException;
import java.io.Serializable;

import main.patternanalysis.OpenURL;
import main.patternanalysis.RankingCount;
import main.ranking.CalculateExp;

public class SearchResult implements Serializable {
	private static final long serialVersionUID = 1L;
	String engine = null;
	String title = null;
	String url = null;
	String snippet = null;
	String searchPage = null;
	public RankingCount rankingCount = new RankingCount();

	int resultNumber = 0; // 결과 번호
	double exposure = 0; // 노출도

	public SearchResult(String engine, String title, String url,
			String snippet, String searchPage, int resultNumber) {
		this.engine = engine;
		this.title = title;
		this.url = url;
		this.snippet = snippet;
		this.searchPage = searchPage;
		this.resultNumber = resultNumber;
	}

	public double getExposure() {
		return exposure;
	}

	public void setExposure(double exposure) {
		this.exposure = exposure;
	}

	public String getTitle() {
		return title;
	}

	public String getSearchPage() {
		return searchPage;
	}

	public void setSearchPage(String searchPage) {
		this.searchPage = searchPage;
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

	public void openURL() {
		OpenURL openUrl = new OpenURL(url);
		try {
			openUrl.urlRead();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("들어간 URL : " + url);
		this.rankingCount = openUrl.counting();
	}

	public void calExp() {
		CalculateExp calExp = new CalculateExp(rankingCount);
		exposure = calExp.getExposure();
		System.out.println("이 url의 노출도는 : " + exposure);
	}
}
