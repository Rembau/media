package servlet;

import java.sql.Statement;
import java.util.TreeMap;

import javabean.Conn;
import javabean.SqlWork;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class ServletFather extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public TreeMap<String,String> attributes;
	public SqlWork s;
	public Conn conn;
	public HttpSession session;
	public Statement stmt;
	public ServletFather() {
		super();
		System.out.println("father");
	}
	public void destroy() {
		super.destroy();
	}
	public void before(HttpServletRequest request){
		session=request.getSession();
		attributes=GetAttributes.getA(request);
		conn=(Conn)(request.getSession().getAttribute("conn"));
		s=new SqlWork(conn);
		stmt=conn.getStmt();
		
		/*if(session.getAttribute("name")==null){
			System.out.println("session is over");
		}
		Cookie[] c=request.getCookies();
		for(int i=0;i<c.length;i++){
			session.setAttribute(c[i].getName(), c[i].getValue());
			try {
				System.out.println("cookie "+c[i].getName()+" "+URLDecoder.decode(c[i].getValue(),"utf-8")+" "+c[i].getPath());
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}*/
	}
}
