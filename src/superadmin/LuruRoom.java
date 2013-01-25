package superadmin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.StringTokenizer;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import servlet.ServletFather;

public class LuruRoom extends ServletFather {

	private static final long serialVersionUID = 1L;

	public LuruRoom() {
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
		String allroom=attributes.get("allroom");
		String area=attributes.get("area");
		String layer=attributes.get("layer");
		StringTokenizer fen=new StringTokenizer(allroom,", "); 
		String room[]=new String[100];
		int introomnum=0;
		String sql;
		ResultSet rs;
		String strroom;
		try{
			sql="select * from media_site where sit_area='"+area+"' and sit_name='"+layer+"'";
		    rs=s.select(stmt, sql);
		    String nummark;
		    rs.next();
		    nummark=rs.getString(3);
		while(fen.hasMoreTokens() )
		{
		  strroom=fen.nextToken();
		  System.out.println(strroom);
		  if((Integer.parseInt(strroom)/100)<=0 ||(Integer.parseInt(strroom)/100)>10){
			  out.print("����İ༶"+strroom+"<br>");
			  continue;
		  }
		  strroom=nummark+""+strroom;
		  sql="select * from media_rooms where ro_room='"+strroom+"' and ro_area='"+area+"'";//out.print(sql+"<br>");
		  rs=s.select(stmt, sql);
		  if(!rs.next()){
		  room[introomnum]=strroom;
		  out.print("��¼����");
		  out.print(Integer.parseInt(strroom)%1000);
		  out.print("����<br>");
		  sql="insert into media_rooms(ro_room,ro_area) values('"+room[introomnum]+"','"+area+"')";//out.print(sql+"<br>");
		  s.insert(sql);
		  introomnum++;
		}
		else {out.print(strroom+"�����Ѵ���<br>");}
		}
				new LuruRoomThread(introomnum,area,room,1).start();
				out.print("<script>alert('¼��ɹ�');</script>");
		}
		catch(SQLException e){
			   out.println("sql�쳣");
		}
		out.flush();
		out.close();
	}
	public void init() throws ServletException {
	}
	
}
