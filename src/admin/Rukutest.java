package admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javabean.SendMail;
import servlet.ServletFather;

public class Rukutest extends ServletFather{

	private static final long serialVersionUID = 1L;

	public Rukutest() {
		super();
	}

	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		before(request);
		PrintWriter out = response.getWriter();
		String send=attributes.get("send");
		String password=attributes.get("password");
		String service=attributes.get("service");
		String topic=attributes.get("topic");
		String accept=attributes.get("accept");
		String content=attributes.get("content");
		String num=session.getAttribute("num").toString();
		
		try {
			  String sql="select * from media_mailnum where ma_user='"+num.toString()+"'";
			  ResultSet rs=conn.stmt.executeQuery(sql);
			  if(rs.last()){
				  send=rs.getString(1); 
			      password=rs.getString(2);
			      service=rs.getString(3);
			      out.print(new SendMail().MailTest(topic, send, password, service, accept, content));
			      System.out.println(topic+""+ send+""+  password+""+  service+""+  accept+""+  content);
			   }
			  else out.println("<script>alert('«Îµ«¬ºƒ„µƒ” œ‰');window.location.href='../admin/loginmail.jsp';</script>");
			 }
			   catch(SQLException e){
			   out.print("sql“Ï≥£");
			   }
		out.flush();
		out.close();
	}

	public void init() throws ServletException {
		// Put your code here
	}

}
