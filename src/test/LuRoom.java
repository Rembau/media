package test;

import java.sql.SQLException;
import java.sql.Statement;
import javabean.Conn;

public class LuRoom {
	public static void main(String[] args) {
		String[]week={"1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25"};
		String weekday[]={"星期一","星期二","星期三","星期四","星期五","星期六","星期天"};
		String jieci[]={"第一节","第二节","第三节","第四节","第五节","第六节","第七节","第八节","第九节","第十节","第十一节"};
		String area="南区";
		String room[]={"18101","18102","18103","18104","18205","18206","18207","18208","18209","18210",
				"18211","18212","18305","18306","18307","18308","18309","18310","18311","18312","18401",
				"18402","18403","18405","18406","18407","18408","18409","18410","18411","18412","18501",
				"18502","18503","18505","18506","18507","18508","18509","18510","18511","18512","18605",
				"18606","18607","18608","18609"};
		String sql;
		int count=0;
		Conn con=new Conn();
		Statement stmt=null;
		try {
			stmt = con.getConn().createStatement();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		for(int i=18;i<25;i++)
			for(int j=0;j<7;j++)
			for(int l=0;l<room.length;l++)
			for(int m=0;m<11;m++){
			sql="insert into media_situation(si_area,si_room,si_week,si_weekday,si_jieci) value('"+area+"','"+room[l]+"','"+week[i]+"','"+weekday[j]+"','"+jieci[m]+"')";//out.print(sql+"<br>");			
			try {
				stmt.execute(sql);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			count++;
		}
		con.close();
	}
}
