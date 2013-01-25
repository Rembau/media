package test;

import javabean.Conn;
import javabean.SqlWork;

public class T {
public static void main(String args[]){
	Conn conn=new Conn();
	SqlWork s=new SqlWork(conn);
	String sql="delete from media_rooms where ro_room='17114' and ro_area='南区'";
	s.delete(sql);
	sql="delete from media_situation where si_room='17114' and si_area='南区'";
	s.delete(sql);
	conn.close();
}
}
