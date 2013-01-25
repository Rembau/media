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

public class CannotSelectDate extends ServletFather {
	private static final long serialVersionUID = 1L;
	public CannotSelectDate() {
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
		String startdate=attributes.get("startdate");
		String enddate=attributes.get("enddate");
		String note=attributes.get("note");
		ResultSet rs=connWeek();
		String start[]=handle(startdate,rs);
		String end[]=handle(enddate,rs);
		if(note.equals("删除")){
			delete(startdate,enddate);
			chengeState(start,end,"正常");
		}
		else {
			ruku(startdate,enddate,note);
			//System.out.println(start[0]+" "+start[1]);
			chengeState(start,end,"不能选课");
		}
		out.print("<script>alert('操作成功');window.location.href='cannotselect.jsp';</script>");
		out.flush();
		out.close();
	}
	public void delete(String startdate,String enddate){
		String sql="delete from media_holiday where ho_startday='"+startdate+"' and ho_endday='"+enddate+"'";
		s.delete(sql);
	}
	public void ruku(String startdate,String enddate,String note){
		String sql="insert into media_holiday(ho_startday,ho_endday,ho_note) values('"+startdate+"','"+enddate+"','"+note+"')";
		s.insert(sql);
	}
	public void chengeState(String ss[],String sb[],String state){
		String weekday[]={"星期一","星期二","星期三","星期四","星期五","星期六","星期天"};
		System.out.println(ss[0]+" "+weekday[Integer.parseInt(ss[1])]);
		System.out.println(sb[0]+" "+weekday[Integer.parseInt(sb[1])]);
		String sql="update media_situation set si_holiday='"+state+"' where ";
		if(ss[0].equals(sb[0])){
			for(int i=Integer.parseInt(ss[1]);i<=Integer.parseInt(sb[1]);i++){
				s.insert(sql+"si_week='"+ss[0]+"' and si_weekday='"+weekday[i]+"'");
				System.out.println(sql+"si_week='"+ss[0]+"' and si_weekday='"+weekday[i]+"'");
			}
		}
		else {
			for(int i=Integer.parseInt(ss[1]);i<=6;i++){
				s.insert(sql+"si_week='"+ss[0]+"' and si_weekday='"+weekday[i]+"'");
			}
			for(int i=0;i<=Integer.parseInt(sb[1]);i++){
				s.insert(sql+"si_week='"+sb[0]+"' and si_weekday='"+weekday[i]+"'");
			}
		}
	}
	public String[] handle(String date,ResultSet rs){
		String dates[]=date.split("-");
		String str[]=new String[2];
		String seme[]=null;
		try {
			seme = rs.getString("we_semester").split("-");
			if(!dates[0].equals(seme[0]) && !dates[0].equals(seme[1])){
				return new String[]{"error"};
			}
			int intmarkweek=Integer.parseInt(dates[1])*100+Integer.parseInt(dates[2]);
			System.out.println(intmarkweek);
			int flag=0;
			for(int i=0;i<24;i++){
			    int weeknum=Integer.parseInt(rs.getString(i+1));
			    //System.out.println(weeknum);
			    if(intmarkweek<200 && flag==0){
			    	flag=1;
			    	continue;
			    }
				if(intmarkweek<weeknum){ 
					str[0]=String.valueOf(i);
					if(weeknum-intmarkweek<7){
						str[1]=String.valueOf(7-(weeknum-intmarkweek));
					}
					else str[1]=String.valueOf(intmarkweek-Integer.parseInt(rs.getString(i)));
					break;
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return str;
	}
	public ResultSet connWeek(){
		ResultSet rs=null;
		String sql="select * from media_week";
		rs=s.select(stmt, sql);
		try {
			rs.last();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	public void init() throws ServletException {
		// Put your code here
	}

}
