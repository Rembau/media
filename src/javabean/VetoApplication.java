package javabean;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class VetoApplication {
	String ap_id;
	public VetoApplication(String ap_id){
		this.ap_id=ap_id;
	}
	public static void handle(String ap_id,String name) throws VetoAppExecption{
		String sql=null;
		Conn conn=new Conn();
		SqlWork s=new SqlWork(conn);
		Statement stmt=conn.getOldStmt();
		ResultSet rs=null;
		try {
			sql="select * from media_application where ap_id = '"+ap_id+"'";
			rs=s.select(stmt, sql);
			rs.next();
			if(rs.getString("ap_state").equals("未通过")){
				throw new VetoAppExecption();
			} //出错 则没有记录
			String strjieci[]={"第一节","第二节","第三节","第四节","第五节","第六节","第七节","第八节","第九节","第十节","第十一节","第十二节"};
			int jiecistart=0;
			for(int ii=0;ii<12;ii++){
				if(strjieci[ii].equals(rs.getString(17))) {
					jiecistart=ii;break;
				}
			}
			if(rs.getString(16).equals("2")){
				sql="update media_situation set si_state ='正常' where si_area='"+rs.getString(6)+"' and si_room='"+rs.getString(5)+"' and si_week='"+rs.getString(3)+"' and si_weekday='"+rs.getString(4)+"' and si_jieci in ('"+strjieci[jiecistart]+"','"+strjieci[jiecistart+1]+"')";
			}
			else{
				sql="update media_situation set si_state ='正常' where si_area='"+rs.getString(6)+"' and si_room='"+rs.getString(5)+"' and si_week='"+rs.getString(3)+"' and si_weekday='"+rs.getString(4)+"' and si_jieci in ('"+strjieci[jiecistart]+"','"+strjieci[jiecistart+1]+"','"+strjieci[jiecistart+2]+"')";
			}
			s.updata(sql);
			sql="update media_application set ap_state ='未通过' where ap_id='"+ap_id+"'";
			s.updata(sql);
			sql="delete from media_table where ta_sqid='"+ap_id+"'";
			s.delete(sql);
			String str=null;
			//System.out.println(room);
			try {
				sql="select * from media_application where ap_id = '"+ap_id+"'";
				rs=s.select(stmt, sql);
				rs.next();
				sql="select * from media_site where sit_nummark='"+Integer.parseInt(rs.getString("ap_room"))/1000+"'";
				Statement stmt1=conn.getStmt();
				ResultSet rs2=s.select(stmt1, sql);
				rs2.next();
				str = "您的申请记录:<br>  第"+rs.getString("ap_week")+"周,"+rs.getString("ap_weekday")+"" +
						","+rs.getString("ap_jieci")+","+rs.getString("ap_area")+","+rs2.getString("sit_name")+"," +
								""+Integer.parseInt(rs.getString("ap_room"))%1000+"<br>被管理员取消";
				sql="insert into media_remind(re_num,re_name,re_content,re_admin) values('"+rs.getString("ap_num")+"','"+rs.getString("ap_name")+"','"+str+"','"+name+"')";
			    s.insert(sql);
			    System.out.println(str);
			    stmt1.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
			conn.close();
		}
	}
	public static void main(String[] args) {
	}
}
