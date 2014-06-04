package main.ranking;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.Vector;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import main.search.MakeObject;
import main.search.SearchResult;

public class Ranking {
	public static Vector<SearchResult> result;
	private int client_num;
	private int client_grade;
	public ProgressObserver observer;

	public void setObserver(ProgressObserver observer) {
		this.observer = observer;
	}
	
	public Ranking(int client_num, ProgressObserver observer) {
		this.client_num = client_num;
		this.setObserver(observer);
	}

	class ResultThread implements Runnable {
		int i;

		public ResultThread(int i) {
			this.i = i;
		}

		@Override
		public void run() {
			result.get(i).openURL();
			
			return;
		}
	}

	public Vector<SearchResult> getResult(ArrayList<String> searchWordList)
			throws IllegalAccessException, InvocationTargetException,
			NoSuchMethodException, IOException {
		ExpDataBean expData = null;
		MakeObject makeObject = new MakeObject();
		PageRank pageRank = new PageRank();
		CalculateExp calExp;
		ExposureGraph expGraph = null;

		double finalExp = 0;

		// 먼저, 구글, 네이버, 다음 검색하게 하고
		result = makeObject.getResult(searchWordList);
		
		int googleCount = 0, naverCount = 0, daumCount = 0;
		for(int i=0; i<result.size(); i++){
			if(result.get(i).getEngine().equals("Daum")){
				daumCount++;
			}
			else if(result.get(i).getEngine().equals("Naver")){
				naverCount++;
			}
			else if(result.get(i).getEngine().equals("Google")){
				googleCount++;
			}
		}
		System.out.println(googleCount + "    " + naverCount + "     " +  daumCount);
		
		
		// 중복 URL 체크
		System.out.println("중복체크 이전의 result 사이즈 : " + result.size());
		checkDupUrl();
		System.out.println("중복체크 직후의 result 사이즈 : " + result.size());

		// 페이지 분석 Threading
		ExecutorService service = Executors.newFixedThreadPool(50);
		
		for (int i = 0; i < result.size(); i++) {
			service.execute(new ResultThread(i));
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

		
		// 페이지 분석 후 위험도 계산
		System.out.println("======위험도 계산중...======");
		for (int i = 0; i < result.size(); i++) {
			
			//result.get(i).calExp();
			
			calExp = new CalculateExp(result.get(i).rankingCount);
			result.get(i).setExposure(calExp.getExposure(result.get(i).getPr()));
			
		}
		System.out.println("======위험도 계산 끝======");

		// 정렬
		sortResult();
		pruningAlgorithm();
		System.out
				.println("pruningAlgorithm 직후의 result 사이즈 : " + result.size());

		
		
		double sumExp = 0;
		
		for(int i=0; i<result.size(); i++){
			sumExp += result.get(i).getExposure();
		}
		System.out.println("이게 사용자 특정화 데이터 : " + sumExp);
		
		finalExp = Math.round(sumExp / 100);
		
		expData = new ExpDataBean();
		expData = getExpData(client_num, finalExp);
		
		int grade = (int) (Math.round(finalExp) / 1000);
		
		setClient_grade(grade);
		
		try {
			expGraph.insertExprecord(expData);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

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

	public int getClient_grade() {
		return client_grade;
	}

	public void setClient_grade(int client_grade) {
		this.client_grade = client_grade;
	}
}
