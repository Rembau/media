package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FaultSolve extends ServletFather {
	private static final long serialVersionUID = 1L;

	public FaultSolve() {
		super();
	}

	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		before(request);
		String id=attributes.get("id");
		String solve=attributes.get("solve");
		String markpage=attributes.get("markpage");
		PrintWriter out = response.getWriter();
		try{
		 	String sql="select * from media_fault where fa_id='"+id+"'";
		ResultSet rs=s.select(stmt, sql);
		rs.next();
		//out.print(rs.getString(3));
		sql="update media_situation set si_nowstate ='正常' where si_room='"+rs.getString(3)+"' and si_area='"+rs.getString(2)+"'";
		s.updata(sql);
		sql="update media_fault set fa_state='已解决',fa_solve='"+solve+"' where fa_id='"+id+"'";
		s.updata(sql);
		out.print("<script>alert('提交成功');window.location.href='fault.jsp?&id="+id+"&markpage="+markpage+"';</script>");
		 }
		 catch(SQLException e1)
	   {
	     out.print("SQL异常");
	   }finally{
		   try {
			stmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		out.flush();
		out.close();
	   }
	}

	public void init() throws ServletException {
		// Put your code here
	}

}
