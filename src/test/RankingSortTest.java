package test;

import java.util.ArrayList;

public class RankingSortTest {

	public static int partition(ArrayList<Integer> arr, int left, int right,
			int pivotIndex) {
		int pivotValue = arr.get(pivotIndex);
		int tmp = arr.get(pivotIndex);
		arr.set(pivotIndex, arr.get(right));
		arr.set(right, tmp);

		int storeIndex = left;

		for (int i = left; i < right; i++) {
			if (arr.get(i) > pivotValue) { // '<'를 ">로 바꿔서 오름차순 정렬완료
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

	public static void quicksort(ArrayList<Integer> arr, int left, int right) {
		
		if (right > left) {
			int pivotIndex = left + (right - left) / 2;
			int pivotNewIndex = partition(arr, left, right, pivotIndex);
			quicksort(arr, left, pivotNewIndex - 1);
			quicksort(arr, pivotNewIndex + 1, right);
		}
		
	}

	public static void main(String[] args) {
		ArrayList<Integer> arr = new ArrayList<Integer>();
		arr.add(6);
		arr.add(2);
		arr.add(3);
		arr.add(9);
		arr.add(4);
		arr.add(7);
		arr.add(1);
		arr.add(5);
		arr.add(10);
		arr.add(8);

		quicksort(arr, 0, arr.size() - 1);
		for (int i = 0; i < arr.size(); ++i)
			System.out.print(arr.get(i) + " ");
	}

}
