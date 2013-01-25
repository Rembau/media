package javabean;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class InsertApplication {

	public static String handle(String area,String room,String week,String weekday,String jieci,String alljie,String name,String num,String depart){
		String sql=null;
		Conn conn=new Conn();
		SqlWork s=new SqlWork(conn);
		Statement stmt=conn.getStmt();
		ResultSet rs=null;
		String strjieci[]={"第一节","第二节","第三节","第四节","第五节","第六节","第七节","第八节","第九节","第十节","第十一节","第十二节"};
		try{
		    int jiecistart=0;
		    for(int ii=0;ii<12;ii++){
		    	if(strjieci[ii].equals(jieci)) 
		    		jiecistart=ii;
		    }
		    if(alljie.equals("3"))
		    	sql="select * from media_situation where si_area='"+area+"' and si_room='"+room+"' and si_week='"+week+"' and si_weekday='"+weekday+"' and si_jieci in('"+strjieci[jiecistart]+"','"+strjieci[jiecistart+1]+"','"+strjieci[jiecistart+2]+"')";
		    else if(alljie.equals("2"))
		    	sql="select * from media_situation where si_area='"+area+"' and si_room='"+room+"' and si_week='"+week+"' and si_weekday='"+weekday+"' and si_jieci in('"+strjieci[jiecistart]+"','"+strjieci[jiecistart+1]+"')";
		    		rs=s.select(stmt, sql);
		    		int markstate=0;
		    		while(rs.next()){
		    			if(rs.getString(5).equals("占用")){ 
		    				markstate=1;
		    			}
		    		}
		    		if(alljie.equals("3"))
		    			sql="select * from media_table where  ta_num='"+num.toString()+"' and ta_area='"+area+"' and ta_week='"+week+"' and ta_weekday='"+weekday+"' and ta_jiecistart in('"+strjieci[jiecistart]+"','"+strjieci[jiecistart+1]+"','"+strjieci[jiecistart+2]+"')";
		    		else if(alljie.equals("2"))
		    			sql="select * from media_table where ta_num='"+num.toString()+"' and  ta_area='"+area+"'  and ta_week='"+week+"' and ta_weekday='"+weekday+"' and ta_jiecistart in('"+strjieci[jiecistart]+"','"+strjieci[jiecistart+1]+"')";
		    		//out.print(sql);
		    		rs=s.select(stmt, sql);
		    		while(rs.next()){
		    			markstate=2;
		    			break;
		    		}
		    		if(markstate==0){
		    			sql="insert into media_table(ta_num,ta_week,ta_weekday,ta_jiecistart,ta_alljie,ta_area,ta_room) values('"+num+"','"+week+"','"+weekday+"','"+jieci+"','"+alljie+"','"+area+"','"+room+"')";
		    			//out.print(sql);
		    			s.insert(sql);
		    			//out.print(alljie);
		    			String alljieci=null;
		    			if(alljie.equals("2")){ 
		    				alljieci=strjieci[jiecistart]+","+strjieci[jiecistart+1];
		    			}
		    			if(alljie.equals("3")){ 
		    				alljieci=strjieci[jiecistart]+","+strjieci[jiecistart+1]+","+strjieci[jiecistart+2]; 
		    			}
		    			sql="insert into media_application(ap_name,ap_week,ap_weekday,ap_room,ap_area,ap_jieci,ap_depart,ap_num,ap_note,ap_alljie,ap_startjieci) values('"+name+"','"+week+"','"+weekday+"','"+room+"','"+area+"','"+alljieci+"','"+depart+"','"+num+"','无','"+alljie+"','"+jieci+"')";
		    			s.insert(sql);
		    			sql="select max(ap_id) from media_application";
		    			rs=s.select(stmt, sql);
		    			rs.next();
		    			String sqid=rs.getString(1);
		    			sql="select max(ta_id) from media_table";
		    			ResultSet rs1=s.select(stmt, sql);
		    			rs1.next();
		    			sql="update media_table set ta_sqid='"+sqid+"' where ta_id='"+rs1.getString(1)+"'";
		    			String tableid=rs1.getString(1);
		    			s.updata(sql);
		    			sql="update media_application set ap_tableid='"+tableid+"' where ap_id='"+sqid+"'";
		    			s.updata(sql);
		   
		    			if(alljie.equals("2")){
		    				sql="update media_situation set si_state ='占用' where si_area='"+area+"' and si_room='"+room+"' and si_week='"+week+"' and si_weekday='"+weekday+"' and si_jieci in ('"+strjieci[jiecistart]+"','"+strjieci[jiecistart+1]+"')";
		    				s.updata(sql);
		    			}
		    			if(alljie.equals("3")){
		    				sql="update media_situation set si_state ='占用' where si_area='"+area+"' and si_room='"+room+"' and si_week='"+week+"' and si_weekday='"+weekday+"' and si_jieci in ('"+strjieci[jiecistart]+"','"+strjieci[jiecistart+1]+"','"+strjieci[jiecistart+2]+"')";
		                    s.updata(sql);
		                }
		    		    new log.Logs().getloga().info(num+" "+name+"申请成功"+sql);
		    		    return "1";
		    		}
		    		else if(markstate==1){
		    			new log.Logs().getloga().info(num+" "+name+"课时被占用"+sql);
		    			return "2";
		    		}
		    		else {
			    		new log.Logs().getloga().info(num+" "+name+"与自己课时时间段冲突"+sql);
		    			return "3";
		    		}
		   }catch(SQLException e1){
   			   System.out.println(sql);
			   new log.Logs().getloga().info(num+" "+name+"未知错误"+e1.getMessage());
		   }finally{
			   conn.close();
		   }
		   return "4";
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
