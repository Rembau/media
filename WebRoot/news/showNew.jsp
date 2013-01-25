<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="GB18030"%>
<jsp:useBean id="conn" class="javabean.Conn" scope="session"></jsp:useBean>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>My JSP 'showNew.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="styles.css">
  </head>
  <%
  String table = request.getParameter("table") != null ? request.getParameter("table") : ""; 
  String id = request.getParameter("id") != null ? request.getParameter("id") : "";
  %>
  <body>
  <%
  String sql="";
  if(table.trim().equals("media_news")){
  	sql="select * from "+table+" where ne_id='"+id+"'";
  	ResultSet rs=conn.stmt.executeQuery(sql); 
  	if(rs.next())
  		out.print(rs.getString("ne_content"));
  }
  else {
  	sql="select * from "+table+" where ad_id='"+id+"'";
  	ResultSet rs=conn.stmt.executeQuery(sql); 
  	if(rs.next())
  		out.print(rs.getString("ad_content"));
  }
  if((session.getAttribute("state")).equals("超级管理员"))
  {
  	out.print("<br><a href=\"updata.jsp?table="+table+"&id="+id+"\">修改</a>");
  }
  %>
  </body>
</html>
