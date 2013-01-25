package filters;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class FilterEncode implements Filter {

	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		 HttpServletRequest req = (HttpServletRequest) request;
		 response.setCharacterEncoding("GBK");
		 String url=req.getRequestURI();
		 if(url.endsWith("zh_CN.js"))
		 {
			 response.setCharacterEncoding("utf-8");
			 System.out.println("sssssssssssssssssss");
		 }
		 System.out.println(url);
		 if(url.endsWith(".gif") || url.endsWith(".jpg") || url.endsWith(".bmp")){
			 chain.doFilter(request, response);
			 return;
		 }
		 HttpServletResponse res = (HttpServletResponse) response;
		 HttpSession session=req.getSession();
		 Cookie[] c=req.getCookies();
		 
		 if(url.endsWith("landing.jsp") || url.endsWith("LoginJump") ||url.endsWith("media/")||url.endsWith(".gif")){
				System.out.println("This is login frame");
				Cookie cc = new Cookie("isLogin",URLEncoder.encode("no","utf-8"));
			    //c.setMaxAge(60*60);
			    cc.setPath("/");
				res.addCookie(cc);
				chain.doFilter(request, response);
				return;
		 }
		 
		 if(req.getCookies()==null || c.length<=1){
			 System.out.println("Cookie is over");
				res.sendRedirect("./landing.jsp");
				return;
		 }
		 else if(session.getAttribute("name")==null){
				System.out.println("session is over");
			    addSessionValue(session,c);	
		 }
		 else if(!isLogin(req.getCookies()) && !url.endsWith("LoginJump") && !url.endsWith("landing.jsp") && !url.endsWith("media/")
				 && !url.endsWith("loginhelp.jsp") && !url.endsWith("register.jsp") && !url.endsWith("Register") 
				 && !url.endsWith(".ChangePW") && !url.endsWith("change.jsp") && url.indexOf("error")==-1){
			 PrintWriter out = response.getWriter();
			 if(url.endsWith("changeany.jsp") || url.endsWith("welcome.jsp")){
				 out.print("<script>alert('ÏÈµÇÂ¼');window.top.location.href='./landing.jsp';</script>");
			 }
			 else {
				 out.print("<script>alert('ÏÈµÇÂ¼');window.top.location.href='../landing.jsp';</script>");
			 }
			 return;
		 }
		//System.out.println("fiter--------");
		chain.doFilter(request, response);
	}
	boolean isLogin(Cookie[] c){
		for(int i=0;i<c.length;i++){
			   try {					
				   //System.out.println("cookie "+c[i].getName()+" "+URLDecoder.decode(c[i].getValue(),"utf-8"));
				if(c[i].getName().equals("isLogin") && URLDecoder.decode(c[i].getValue(),"utf-8").equals("no")){
					   return false;
				   }
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		   }
		return true;
	}
	void addSessionValue(HttpSession session,Cookie[] c){
		 /*try {
			System.out.println("cookie "+c[6].getName()+" "+URLDecoder.decode(c[6].getValue(),"utf-8"));
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
		for(int i=0;i<c.length;i++){
			   try {
				   session.setAttribute(c[i].getName(), URLDecoder.decode(c[i].getValue(),"utf-8"));
				   System.out.println("cookie "+c[i].getName()+" "+URLDecoder.decode(c[i].getValue(),"utf-8")+" "+c[i].getPath());
			    } catch (UnsupportedEncodingException e) {
				  e.printStackTrace();
			    }
		   }
	}
	public void init(FilterConfig filterConfig) throws ServletException {
		
	}

}
