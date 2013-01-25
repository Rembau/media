package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.StringTokenizer;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AddFault extends ServletFather {

	private static final long serialVersionUID = 1L;

	public AddFault() {
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
		String floor1=attributes.get("floor1");
		String room=attributes.get("room");
		if(room.equals("")){
			out.print("<script>alert('教室不能为空');window.location.href='addfault.jsp?id=0';</script>");
		}
		room=floor1+""+room;
		String area=attributes.get("area");
		String topic=attributes.get("topic");
		String content=attributes.get("content");
		if(content.equals("")){
			out.print("<script>alert('请填写故障详细内容');window.location.href='addfault.jsp?id=0';</script>");
		}
		Object num=session.getAttribute("num");
		Object name=session.getAttribute("name");
		try {
			String sql;
			int mark=0;
			sql="select * from media_rooms where ro_room='"+room+"' and ro_area='"+area+"'";
			ResultSet rs2=conn.stmt.executeQuery(sql);
			if(rs2.next()){
				sql="select * from media_fault  where fa_room ='"+room+"' and fa_area='"+area+"'";
				ResultSet rs1=conn.stmt.executeQuery(sql);
				if(rs1.last()){
					int num1=0;
					Date date=new Date();
					SimpleDateFormat matter=new SimpleDateFormat("MM");
					String mm=matter.format(date);
					matter =new SimpleDateFormat("dd");
					String dd=matter.format(date);
					int intmm=Integer.parseInt(mm); 
					int intdd=Integer.parseInt(dd); 
					//out.print(matter.format(date)+"<br>");

					String time=rs1.getString(7);
					StringTokenizer fen=new StringTokenizer(time,"-:. ");
					String m="";
					String d="";
					while(fen.hasMoreTokens() ){
						if(num1==1){m=fen.nextToken();}
						else if(num1==2){d=fen.nextToken();}
						else fen.nextToken();
						num1++;
					}
					int intm=Integer.parseInt(m); 
					int intd=Integer.parseInt(d); 
					if(intmm==intm && (intdd-intd)<=1){
						out.print("<script>alert('该教室故障已记录');window.location.href='addfault.jsp?id=0';</script>");
						mark=1;
					}
				}
				if(mark==0){
					sql="insert into media_fault(fa_area,fa_room,fa_content,fa_name,fa_topic,fa_num,fa_state) value('"+area+"','"+room+"','"+content+"','"+name.toString()+"','"+topic+"','"+num.toString()+"','已确认')";
					s.insert(sql);
					sql="update media_situation set si_nowstate='故障' where si_area ='"+area+"' and si_room='"+room+"'";
					s.updata(sql);
					out.print("<script>alert('提交成功');window.location.href='addfault.jsp?id=0';</script>");}
				}
			else {out.print("<script>alert('没有该教室');window.location.href='addfault.jsp?id=0';</script>");}
			}
		catch(SQLException e1){
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

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
