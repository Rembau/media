package superadmin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import servlet.ServletFather;

public class ChangeHelp extends ServletFather {

	private static final long serialVersionUID = 1L;

	public ChangeHelp() {
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
		String mark=attributes.get("mark");
		String content=attributes.get("content");
		String sql="select * from media_help";
		ResultSet rs=s.select(stmt, sql);
		try {
			if(rs.next()){
				sql="update media_help set content"+mark+" ='"+content+"'";
			    s.updata(sql);
			}
			else {
				sql="insert into media_help(content"+mark+") value('"+content+"')";
				s.insert(sql);
			}
			System.out.println(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		out.print("ÐÞ¸Ä³É¹¦");
		out.close();
	}

	public void init() throws ServletException {
		// Put your code here
	}

}
