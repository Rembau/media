package servlet;

import java.util.Enumeration;
import java.util.TreeMap;
import javax.servlet.http.HttpServletRequest;

public class GetAttributes {

	public static TreeMap<String,String> getA(HttpServletRequest request){
		Enumeration<String> en=request.getParameterNames();
		TreeMap<String,String> a=new TreeMap<String,String>();
		String p;
		String v;
		while(en.hasMoreElements()){
			p=en.nextElement();
			v=ChangeCode.execString(request.getParameter(p));
			if(!v.equals(""))
				System.out.println(p+" "+v);
			else System.out.println(p);
			a.put(p, ChangeCode.execString(request.getParameter(p)).trim());
		}
		return a;
	} 
}
