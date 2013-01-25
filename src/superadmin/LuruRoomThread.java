package superadmin;

import javabean.Conn;
import javabean.SqlWork;

public class LuruRoomThread extends Thread{
	int introomnum;
	String area;
	String []room;
	String _room;
	int mark=0;
	Conn conn=new Conn();
    SqlWork s=new SqlWork(conn);
	static int block=0;
	public LuruRoomThread(int introomnum,String area,String room[],int mark){
		this.introomnum=introomnum;
		this.area=area;
		this.room=room;
		this.mark=mark;
	}
	public LuruRoomThread(String room,String area){
		this._room=room;
		this.area=area;
	}
	public void run(){
	    while(true){
	    	if(LuruRoomThread.block==0 && mark==1){
	    		System.out.println("ruku() start");
	    		ruku();
	    		System.out.println("ruku() end");
	    		conn.close();
	    		return;
	    	}
		    else if(LuruRoomThread.block==0){
		    	System.out.println("delete()");
		    	delete();
		    	conn.close();
		    	return;
		    }
	    	try {
				Thread.sleep(3000);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	    }
	}
	void ruku(){
		    LuruRoomThread.block=1;
			String[]week={"1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25"};
			String weekday[]={"星期一","星期二","星期三","星期四","星期五","星期六","星期天"};
			String jieci[]={"第一节","第二节","第三节","第四节","第五节","第六节","第七节","第八节","第九节","第十节","第十一节"};
			
			String sql;
			int count=0;
			for(int i=0;i<25;i++)//南区
				for(int j=0;j<7;j++)
				for(int l=0;l<introomnum;l++)
				for(int m=0;m<11;m++){
				sql="insert into media_situation(si_area,si_room,si_week,si_weekday,si_jieci) value('"+area+"','"+room[l]+"','"+week[i]+"','"+weekday[j]+"','"+jieci[m]+"')";//out.print(sql+"<br>");			
				s.insert(sql);
				count++;
			}
			LuruRoomThread.block=0;
	}
	void delete(){
		LuruRoomThread.block=1;
		String sql="delete from media_situation where si_room='"+_room+"' and si_area='"+area+"'";
		s.delete(sql);
		LuruRoomThread.block=0;
	}
}
