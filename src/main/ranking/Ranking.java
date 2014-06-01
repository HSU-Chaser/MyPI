package main.ranking;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.Vector;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import main.patternanalysis.OpenURL;
import main.search.MakeObject;
import main.search.SearchResult;

public class Ranking {

	static Vector<SearchResult> result;
	static Vector<OpenURL> openURLList;

	private int client_num;

	public Ranking(int client_num) {
		this.client_num = client_num;
	}

	class openURLThread implements Runnable {
		OpenURL openUrl;

		public openURLThread(String url) {
			openUrl = new OpenURL(url);
		}

		public OpenURL getOpenUrl() {
			return openUrl;
		}

		@Override
		public void run() {
			try {
				openUrl.urlRead();
			} catch (Exception e) {
				e.printStackTrace();
			}
			openURLList.add(openUrl);
			return;
		}
	}

	public Vector<SearchResult> getResult(ArrayList<String> searchWordList)
			throws IllegalAccessException, InvocationTargetException,
			NoSuchMethodException, IOException {
		ExpDataBean expData = null;
		CalculateExp calExp = null;
		MakeObject makeObject = new MakeObject();
		PageRank pageRank = new PageRank();

		int googleCount = 0;
		int naverCount = 0;
		int daumCount = 0;

		double finalExp = 0;

		// 먼저, 구글, 네이버, 다음 검색하게 하고
		result = makeObject.getResult(searchWordList);

		ExecutorService service = Executors.newFixedThreadPool(50);
		openURLList = new Vector<OpenURL>(result.size());
		for (int i = 0; i < result.size(); i++) {
			SearchResult sr = result.get(i);
			service.execute(new openURLThread(sr.getURL()));
		}

		System.out.println("======페이지 분석중...======");
		service.shutdown();
		while (true) {
			if (service.isTerminated()) {
				System.out.println("======페이지 분석 끝======");
				break;
			}
			try {
				Thread.sleep(100);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		System.out.println("======위험도 계산중...======");

		System.out.println("result 사이즈 : " + result.size() + " openURLList 사이즈 : " + openURLList.size());
		
		for (int i = 0; i < openURLList.size(); i++) {

			SearchResult sr = null;
			double exposure = 0;
			OpenURL openUrl = openURLList.get(i);

			for (int j = 0; j < result.size(); j++) {
				
				System.out.println(result.get(j).getURL());	
				System.out.println(openUrl.originUrl);
				if (result.get(j).getURL().equals(openUrl.originUrl)) {
					sr = result.get(j);
				}
				
			}
			
			if (sr == null) {
				System.out.println("sr에 객체 안들어감");
			}

			openUrl.counting();

			calExp = new CalculateExp();
			// 계산을 해서, exposure를 리턴해줘서 받으면 됨
			exposure = calExp.getExposure(sr.getURL());
			System.out.println("이 url의 노출도는 : " + exposure);
			sr.setExposure(exposure);
			result.set(i, sr);
		}

		System.out.println("======위험도 계산 끝======");

		sortResult();
		System.out.println("퀵소트 직후의 result 사이즈 : " + result.size());
		checkDupUrl();
		System.out.println("중복체크 직후의 result 사이즈 : " + result.size());
		pruningAlgorithm();
		System.out
				.println("pruningAlgorithm 직후의 result 사이즈 : " + result.size());

		// //pageRank 합산
		// for (int i = 0; i < result.size(); i++) {
		// result.get(i).setExposure(
		// result.get(i).getExposure()
		// * pageRank.getPR(result.get(i).getURL()));
		// }

		expData = new ExpDataBean();
		expData = getExpData(client_num, finalExp);

		return result;

	}

	public ExpDataBean getExpData(int client_num, double finalExp) {

		ExpDataBean expData = null;
		expData = new ExpDataBean();

		GregorianCalendar cal = new GregorianCalendar();

		String year = Integer.toString(cal.get(Calendar.YEAR));
		String month = Integer.toString(cal.get(Calendar.MONTH) + 1);
		String day = Integer.toString(cal.get(Calendar.DATE));

		expData.setClient_num(client_num);
		expData.setDate(year + "." + month + "." + day);
		expData.setExposure(finalExp);

		return expData;
	}

	public void pruningAlgorithm() {

		int resultSize = result.size();

		// exposure 0, -1인 객체 삭제
		for (int i = 0; i < resultSize; i++) {

			if ((result.get(i).getExposure() == 0)
					|| (result.get(i).getExposure() == -1)) {

				result.remove(i);
				i--;
				resultSize--;

			}

		}
	}

	// URL duplication check after sort(바로 옆에 있는 것만 체크)
	public void checkDupUrl() {

		int currentSize = result.size();

		for (int i = 0; i < currentSize - 1; i++) {

			for (int j = i + 1; j < currentSize; j++) {

				if (result.get(i).getURL().equals(result.get(j).getURL())) {

					result.remove(j);
					j--;
					currentSize--;

				}
			}
		}
	}

	// quick_sort
	public void sortResult() {
		quicksort(result, 0, result.size() - 1);
	}

	public int partition(Vector<SearchResult> arr, int left, int right,
			int pivotIndex) {
		SearchResult pivotValue = arr.get(pivotIndex);
		SearchResult tmp = arr.get(pivotIndex);
		arr.set(pivotIndex, arr.get(right));
		arr.set(right, tmp);

		int storeIndex = left;

		for (int i = left; i < right; i++) {
			if (arr.get(i).getExposure() > pivotValue.getExposure()) { // '<'를
																		// ">로
																		// 바꿔서
																		// 오름차순
																		// 정렬완료
				tmp = arr.get(i);
				arr.set(i, arr.get(storeIndex));
				arr.set(storeIndex, tmp);
				storeIndex++;
			}
		}
		tmp = arr.get(storeIndex);
		arr.set(storeIndex, arr.get(right));
		arr.set(right, tmp);

		return storeIndex;
	}

	public void quicksort(Vector<SearchResult> arr, int left, int right) {

		if (right > left) {
			int pivotIndex = left + (right - left) / 2;
			int pivotNewIndex = partition(arr, left, right, pivotIndex);
			quicksort(arr, left, pivotNewIndex - 1);
			quicksort(arr, pivotNewIndex + 1, right);
		}

	}

}
