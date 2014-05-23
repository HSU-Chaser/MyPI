package main.ranking;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.HashMap;

import main.patternanalysis.OpenURL;
import main.search.MakeObject;
import main.search.SearchResult;

public class Ranking {
	static ArrayList<SearchResult> result;

	public ArrayList<SearchResult> getResult(HashMap<String, String> keywordMap) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException, IOException {

		CalculateExp calExp = null;

		MakeObject makeObject = new MakeObject();

		// 먼저, 구글, 네이버, 다음 검색하게 하고
		result = makeObject.getResult(keywordMap);

		for (int i = 0; i < result.size(); i++) {

			SearchResult sr = result.get(i);
			int exposure = 0;
			OpenURL openUrl = new OpenURL(sr.getURL());
			
			try {
				openUrl.urlRead();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			calExp = new CalculateExp(keywordMap);
			// 계산을 해서, exposure를 리턴해줘서 받으면 됨
			exposure = calExp.getExposure();
			System.out.println("이 url의 노출도는 : " + exposure);
			sr.setExposure(exposure);
			result.set(i, sr);
		}

			

		sortResult();
		System.out.println("퀵소트 직후의 result 사이즈 : " + result.size());
		checkDupUrl();
		System.out.println("중복체크 직후의 result 사이즈 : " + result.size());
		
		return result;
	}

	// URL duplication check after sort
	public void checkDupUrl() {

		int currentSize = result.size();

		for (int i = 0; i < currentSize - 1; i++) {

			if (result.get(i).getURL().equals(result.get(i + 1).getURL())) {

				result.remove(i);
				i--;
				currentSize--;
			}
		}
	}

	// quick_sort
	public void sortResult() {
		quicksort(result, 0, result.size() - 1);
	}

	public int partition(ArrayList<SearchResult> arr, int left, int right,
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

	public void quicksort(ArrayList<SearchResult> arr, int left, int right) {

		if (right > left) {
			int pivotIndex = left + (right - left) / 2;
			int pivotNewIndex = partition(arr, left, right, pivotIndex);
			quicksort(arr, left, pivotNewIndex - 1);
			quicksort(arr, pivotNewIndex + 1, right);
		}

	}

}
