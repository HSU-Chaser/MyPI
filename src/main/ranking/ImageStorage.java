package main.ranking;

import java.util.ArrayList;

public class ImageStorage {


	private static ArrayList<String> imgUrlList;
	
	public static ArrayList<String> getImgUrlList(){
		
		if(imgUrlList == null){
			imgUrlList = new ArrayList<String>();
		}
		
		return imgUrlList;
	}
	
	
	
	
	
}
