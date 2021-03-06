package week9;

import java.util.HashMap;
import java.util.Map;

public class Thermometer {	
	private Map<String,Double> locationMap = new HashMap<String,Double>();
	
	public void setCelsius(String location, Double value) {
		locationMap.put(location, value);
	}
	public Double getCelsius(String location) {
		return locationMap.get(location);
	}
	
	public Double getFahrenheit(String location) { //화씨로 변경 
		Double celsius = getCelsius(location);
		if(celsius == null) {
			return null;
		}else {
			return celsius.doubleValue() *1.8 +32;
		}
	}
	
	public String getInfo() {
		return  "Thermometer converter";
	}
}
