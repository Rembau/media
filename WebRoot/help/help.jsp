<%@page contentType="text/html; charset=gb2312" import="java.sql.*"%>
<jsp:useBean id="conn" class="javabean.Conn" scope="session"></jsp:useBean>
<html>
<head>
<title>media</title>
<link href="../css/main_style.css" rel="stylesheet" type="text/css">
</head>
<body>
<span class="bg">
<strong>申请用户操作:</strong>
<%
ResultSet rs;
String sql="select* from media_help";
rs=conn.getOldStmt().executeQuery(sql);
if(rs.next()){
 %>
<pre>
<%=rs.getString(1) %>
</pre>
</span>
<span class="bg">
<strong>管理员操作:</strong>
<pre>
<%=rs.getString(2) %>
</pre>
</span>
<span class="bg">
<strong>超级管理员操作:</strong>
<pre>
<%=rs.getString(3) %>
</pre>
<%} 
else out.println("暂无帮助信息");%>
</span>
</body>
</html>