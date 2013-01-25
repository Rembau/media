package javabean;

import java.sql.*;
public class SqlWork {
	Connection conn;
	Conn con;
	public SqlWork(Conn con){
		this.con=con;
		conn=con.getConn();
	}
	public ResultSet select(Statement stmt,String sql){
		ResultSet rs=null;
		try {
			rs=stmt.executeQuery(sql);
			//System.out.println(sql);
			//new log.Logs().getlogs().info("�ɹ�"+sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			new log.Logs().getlogs().info("ʧ��"+sql);
			new log.Logs().getlogs().info(e.getMessage());
			e.printStackTrace();
		}
		return rs;
	}
	public void updata(String sql){
		Statement stmt=null;
		try {
			stmt=con.getOldStmt();
			stmt.executeUpdate(sql);
			//new log.Logs().getlogu().info("�ɹ�"+sql);
		} catch (SQLException e) {
			new log.Logs().getlogu().info("ʧ��"+sql);
			new log.Logs().getlogu().info(e.getMessage());
			e.printStackTrace();
		}
	}
	public void delete(String sql){
		Statement stmt=null;
		try {
			stmt=con.getOldStmt();
			stmt.executeUpdate(sql);
			//new log.Logs().getlogd().info("�ɹ�"+sql);
		} catch (SQLException e) {
			new log.Logs().getlogd().info("ʧ��"+sql);
			new log.Logs().getlogd().info(e.getMessage());
			e.printStackTrace();
		}
	}
	public void insert(String sql){
		Statement stmt=null;
		try {
			stmt=con.getOldStmt();
			stmt.executeUpdate(sql);
			/*if(!sql.startsWith("insert into media_situation")){
				new log.Logs().getlogi().info("�ɹ�"+sql);
			}*/
		} catch (SQLException e) {
			new log.Logs().getlogi().info("ʧ��"+sql);
			new log.Logs().getlogi().info(e.getMessage());
			e.printStackTrace();
		}
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
