package teacher;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import servlet.ServletFather;

public class Applicationruku1 extends ServletFather{

	private static final long serialVersionUID = 1L;


	public Applicationruku1() {
		super();
	}

	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		before(request);
		
		String jieci=attributes.get("jieci");
		String alljie=attributes.get("alljie");
		String area=attributes.get("area");
		String room=attributes.get("room");
		String week=attributes.get("week");
		String weekday=attributes.get("weekday");
		String depart=session.getAttribute("depart").toString();
		String num=session.getAttribute("num").toString();
		String name=session.getAttribute("name").toString();
		String note=attributes.get("note");

		PrintWriter out = response.getWriter();
		String strjieci[]={"��һ��","�ڶ���","������","���Ľ�","�����","������","���߽�","�ڰ˽�","�ھŽ�","��ʮ��","��ʮһ��","��ʮ����"};
		try{
			String sql=null;
		    int jiecistart=0;
		    for(int ii=0;ii<12;ii++){
		    	if(strjieci[ii].equals(jieci)) jiecistart=ii;
		    }
		    if(alljie.equals("3"))
		    	sql="select * from media_situation where si_area='"+area+"' and si_room='"+room+"' and si_week='"+week+"' and si_weekday='"+weekday+"' and si_jieci in('"+strjieci[jiecistart]+"','"+strjieci[jiecistart+1]+"','"+strjieci[jiecistart+2]+"')";
		    else if(alljie.equals("2"))
		    	sql="select * from media_situation where si_area='"+area+"' and si_room='"+room+"' and si_week='"+week+"' and si_weekday='"+weekday+"' and si_jieci in('"+strjieci[jiecistart]+"','"+strjieci[jiecistart+1]+"')";
		    //out.print(sql);
		    ResultSet rs=s.select(stmt, sql);
		    int markstate=0;
		    while(rs.next()){
		    	if(rs.getString(5).equals("ռ��")){
		    		markstate=1;
		    	}
		    }
		    if(markstate==0){	
		    	//out.print(alljie);
		    	String alljieci=null;
		    	if(alljie.equals("2")){ 
		    		alljieci=strjieci[jiecistart]+","+strjieci[jiecistart+1];
		    	}
		    	if(alljie.equals("3")){ 
		    		alljieci=strjieci[jiecistart]+","+strjieci[jiecistart+1]+","+strjieci[jiecistart+2]; 
		    	}
		    	sql="insert into media_application(ap_name,ap_week,ap_weekday,ap_room,ap_area,ap_jieci,ap_depart,ap_num,ap_note,ap_alljie,ap_startjieci,ap_state) values('"+name.toString()+"','"+week+"','"+weekday+"','"+room+"','"+area+"','"+alljieci+"','"+depart.toString()+"','"+num.toString()+"','"+note+"','"+alljie+"','"+jieci+"','δ����')";
		    	//out.print(sql+"<br>");
		    	s.insert(sql);
		    	out.print("<script>alert('�ύ�ɹ�,��ȴ�����');window.location.href='application1.jsp?area="+area+"&week="+week+"&weekday="+weekday+"&jieci="+jieci+"&ok=0';</script>");
		    }
		    else if(markstate==1){
		    	out.print("<script>alert('��ʱ�α�ռ��');window.location.href='application1.jsp?area="+area+"&week="+week+"&weekday="+weekday+"&jieci="+jieci+"&ok=0';</script>");
		    }
		}
		catch(SQLException e1){
			out.print("SQL�쳣");
		}
		out.flush();
		out.close();
	}

	
	public void init() throws ServletException {
		// Put your code here
	}

}
