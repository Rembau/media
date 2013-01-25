package servlet;

import java.io.UnsupportedEncodingException;

public class ChangeCode {

	static String execString(String str){
		byte[] b;
		try {
			b = str.getBytes("ISO-8859-1");
			return new String(b,"GB18030");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return str;
		}
	}
}
