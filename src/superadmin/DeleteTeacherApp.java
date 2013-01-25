package superadmin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import servlet.ServletFather;

public class DeleteTeacherApp extends ServletFather {

	private static final long serialVersionUID = 1L;
	public DeleteTeacherApp() {
		super();
	}

	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request,response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		before(request);
		PrintWriter out = response.getWriter();
		String num=attributes.get("num");
		String name=attributes.get("name");
		String week=attributes.get("week");
		String apId=attributes.get("apId");
		String sql="select * from media_application where ap_id="+apId+"";
		ResultSet rs=s.select(stmt, sql);
		int jiecinum=0;
		try {
			rs.next();
			jiecinum=Integer.parseInt(rs.getString("ap_alljie"));
			String strjieci[]={"��һ��","�ڶ���","������","���Ľ�","�����","������","���߽�","�ڰ˽�","�ھŽ�","��ʮ��","��ʮһ��","��ʮ����"};
			int jiecistart=0;
			for(int ii=0;ii<12;ii++)
			{if(strjieci[ii].equals(rs.getString(17))) {jiecistart=ii;break;}}
			if(jiecinum==2){
				sql="update media_situation set si_state='����' where si_area='"+rs.getString("ap_area")+"' and si_room='"+rs.getString("ap_room")+"' and " +
						"si_week='"+rs.getString("ap_week")+"' and si_weekday='"+rs.getString("ap_weekday")+"' and " +
								"si_jieci in ('"+strjieci[jiecistart]+"','"+strjieci[jiecistart+1]+"')";
			}
			else if(jiecinum==3){
				sql="update media_situation set si_state='����' where si_area='"+rs.getString("ap_area")+"' and si_room='"+rs.getString("ap_room")+"' and " +
				"si_week='"+rs.getString("ap_week")+"' and si_weekday='"+rs.getString("ap_weekday")+"' and " +
						"si_jieci in ('"+strjieci[jiecistart]+"','"+strjieci[jiecistart+1]+"','"+strjieci[jiecistart+2]+"')";
			}
			//System.out.print(sql);
			s.updata(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String str=null;
		try {
			sql="select * from media_site where sit_nummark='"+Integer.parseInt(rs.getString("ap_room"))/1000+"'";
			ResultSet rs1=s.select(conn.getStmt(), sql);
			rs1.next();
			str = "���������¼:<br>  ��"+rs.getString("ap_week")+"��,"+rs.getString("ap_weekday")+"" +
					","+rs.getString("ap_jieci")+","+rs.getString("ap_area")+","+rs1.getString("sit_name")+"," +
							""+Integer.parseInt(rs.getString("ap_room"))%1000+"<br>������Աȡ��";
		//System.out.println(str);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		sql="delete from media_table where ta_sqid='"+apId+"'";
		s.delete(sql);
		sql="update media_application set ap_state='δͨ��' where ap_id="+apId+"";
		s.updata(sql);
		sql="insert into media_remind(re_num,re_name,re_content,re_admin) values('"+num+"','"+name+"','"+str+"','"+session.getAttribute("name")+"')";
		s.insert(sql);
		out.print("<script>alert('�����ɹ�');window.location.href='./sqtable1.jsp?num="+num+"&name="+name+"&week="+week+"';</script>");
		out.flush();
		out.close();
	}

	public void init() throws ServletException {
		// Put your code here
	}

}
