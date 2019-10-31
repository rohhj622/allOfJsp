package week9;

import java.text.DecimalFormat;

public class FormatUtil {
	public static String number(long number,String pattern) {
		DecimalFormat format = new DecimalFormat(pattern);
		return format.format(number);
	}
	// 정적인 메소드는 그냥 클래스 명으로 부름 
}
