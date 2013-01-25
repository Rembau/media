package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FaultExplain extends ServletFather {
	private static final long serialVersionUID = 1L;

	public FaultExplain() {
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
		String id=attributes.get("id");
		String add=attributes.get("add");
		String markpage=attributes.get("markpage");
		String depart1=attributes.get("depart1");
		try{
		 	String sql="select * from media_fault where fa_id='"+id+"'";
		    ResultSet rs=conn.stmt.executeQuery(sql);
		    rs.next();
		    sql="update media_fault set fa_add='"+add+"',fa_faultdepart='"+depart1+"' where fa_id='"+id+"'";
		    s.updata(sql);
		    out.print("<script>alert('提交成功');window.location.href='fault.jsp?&id="+id+"&markpage="+markpage+"';</script>");
		 }catch(SQLException e1)
		 {
	      out.print("SQL异常");
	    }
		out.flush();
		out.close();
	}

	public void init() throws ServletException {
		// Put your code here
	}

}
