package main.search;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.lang.reflect.InvocationTargetException;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import main.ranking.ImageStorage;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
 
public class ImageSearch {
 
    
	public static ArrayList<String> imageSearchResult = new ArrayList<String>();


    public void setImageSearchResult(String SearchWord, int limit) throws IOException, IllegalAccessException, InvocationTargetException, NoSuchMethodException {
     	  	
 
        String query = SearchWord;
        URL url = new URL("https://ajax.googleapis.com/ajax/services/search/images?v=1.0&q="+URLEncoder.encode(query, "UTF-8")+
                "&userip=192.168.0.7&rsz=" + limit);
        URLConnection connection = url.openConnection();
        connection.addRequestProperty("Referer", "http://google.com");
         
        String line;
        StringBuilder builder = new StringBuilder();
        BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
        while((line = reader.readLine()) != null) {
            builder.append(line);
        }
         
        System.out.println( builder );
                 
        Map<String, Object> classMap = new HashMap<String, Object>();  
        JSONObject jsonObject = JSONObject.fromObject(builder.toString());
        Map<String, Object> model = (Map<String, Object>)JSONObject.toBean(jsonObject, java.util.HashMap.class, classMap);
                 
        JSONArray responseData = JSONArray.fromObject(model.get("responseData"));       
        JSONObject results = responseData.getJSONObject(0);
        JSONArray image_data = JSONArray.fromObject(results.get("results"));
         
        for (int i = 0; i < image_data.size(); i++) {
            //System.out.println( image_data.get(i) );
            JSONArray img_url = JSONArray.fromObject(image_data.get(i));        
            imageSearchResult.add((JSONObject.fromObject(img_url.get(0)).get("url")).toString());
        }
        
    	ImageStorage.getImgUrlList().addAll(imageSearchResult);
        
    }
    
}