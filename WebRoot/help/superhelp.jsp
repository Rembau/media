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
int mark=1;
if(rs.next()){mark=0;}
 %>
<pre>
<%if(mark==0) out.println(rs.getString(1)); %>
<a href="../superadmin/changehelp.jsp?mark=1">修改</a>
</pre>
</span>
<span class="bg">
<strong>管理员操作:</strong>
<pre>
<%if(mark==0)out.println(rs.getString(2)); %>
<a href="../superadmin/changehelp.jsp?mark=2">修改</a>
</pre>
</span>
<span class="bg">
<strong>超级管理员操作:</strong>
<pre>
<%if(mark==0)out.println(rs.getString(3)); %>
<a href="../superadmin/changehelp.jsp?mark=3">修改</a>
</pre>
</span>
</body>
</html>