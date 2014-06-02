package main.search;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Vector;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class MakeObject {
	private static Vector<SearchResult> result;

	GoogleSearch googleSearch = null;
	NaverSearch naverSearch = null;
	DaumSearch daumSearch = null;

	String naverCategory[] = { "blog", "news", "cafearticle", "kin", "webkr",
			"doc" };
	String daumCategory[] = { "board", "web", "knowledge" ,"cafe", "blog" };

	class searchThread implements Runnable {
		String engine, query;
		String category;

		public searchThread(String engine, String query) {
			this.engine = engine;
			this.query = query;
		}

		public searchThread(String engine, String query, String category) {
			this.engine = engine;
			this.query = query;
			this.category = category;
		}

		@Override
		public void run() {
			if (engine.equals("Google")) {
				addingGoogle(query, 10);
			} else if (engine.equals("Naver")) {
				addingNaver(query, 5, category);
			}
			else if(engine.equals("Daum")){
				addingDaum(query, 5, category);
			}
			return;
		}
	}

	// 구글 기준의 검색어를 입력받는다.
	public Vector<SearchResult> getResult(ArrayList<String> searchWordList)
			throws IllegalAccessException, InvocationTargetException,
			NoSuchMethodException, IOException {
		ImageSearch imageSearch = new ImageSearch();
		ArrayList<String> naverSearchWordList = new ArrayList<String>();

		result = null;
		result = new Vector<SearchResult>();

		// null이 들어오지않게 하는 검색으로, 여기서 이미지 검색어를 넣어주면 될 것 같다.
		googleSearch = new GoogleSearch(searchWordList.get(0), 5);
		result = googleSearch.getResult();

		ExecutorService service = Executors.newFixedThreadPool(50);
		// Google 검색 실시
		for (int i = 1; i < searchWordList.size(); i++) {
			service.execute(new searchThread("Google", searchWordList.get(i)));
		}

		// Naver 검색 실시- searchWordList를 Naver식으로 변형하는 한 어레이 리스트
		for (int i = 0; i < searchWordList.size(); i++) {
			if (searchWordList.get(i).contains("AND")) {
				searchWordList
						.set(i, searchWordList.get(i).replace("AND", "+"));
			}
			naverSearchWordList.add(searchWordList.get(i));
			for (int j = 0; j < naverCategory.length; j++) {
				service.execute(new searchThread("Naver", searchWordList.get(i),
						naverCategory[j]));
			}
		}
		
		// Daum 검색 실시- searchWordList를 Naver식으로 변형하는 한 어레이 리스트
		for (int i = 0; i < searchWordList.size(); i++) {
			if (searchWordList.get(i).contains("AND")) {
				searchWordList
						.set(i, searchWordList.get(i).replace("AND", "+"));
			}
			naverSearchWordList.add(searchWordList.get(i));
			for (int j = 0; j < daumCategory.length; j++) {
				service.execute(new searchThread("Daum", searchWordList.get(i),
						daumCategory[j]));
			}
		}
		

		System.out.println("======정보 검색중...======");
		service.shutdown();
		while (true) {
			if (service.isTerminated()) {
				System.out.println("======정보 검색 완료======");
				break;
			}
			try {
				Thread.sleep(100);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}

		// Google 이미지 검색 실시 limit 8이 한계

		try {
			ImageSearch.setImageSearchResult(SearchDic.getImgSearchWord(), 8);
		} catch (IllegalAccessException | InvocationTargetException
				| NoSuchMethodException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return result;
	}

	public static boolean properID(String id) {

		boolean flag = false;

		Pattern proper = Pattern
				.compile("[\\w]{6,10}[\\d]{2,4}|[\\d]{2,4}[\\w]{6,10}");
		Matcher m = proper.matcher(id);

		if (m.matches() == true)
			flag = true;
		else
			flag = false;

		return flag;

	}

	public void addingGoogle(String query, int limit) {

		googleSearch = new GoogleSearch(query, limit);

		result.addAll(googleSearch.getResult());

	}

	public void addingNaver(String query, int limit, String category) {
		naverSearch = new NaverSearch(query, limit, category);
		result.addAll(naverSearch.getResult());
	}

	public void addingDaum(String query, int limit, String category) {

		daumSearch = new DaumSearch(query, limit, category);
		result.addAll(daumSearch.getResult());

	}
}
