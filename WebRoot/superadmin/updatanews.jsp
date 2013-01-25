<%@page contentType="text/html; charset=GB2312" language="java" import="java.sql.*"%>
<jsp:useBean id="conn" class="javabean.Conn" scope="session"></jsp:useBean>
<html>
<head>
<link rel="Shortcut Icon" href="../ico/1.ico">
<title>修改</title>
<link href="../css/main_style.css" rel="stylesheet" type="text/css">
</head>
<body>
<%
	  String id=null;
     id=request.getParameter("id");
	 if(id!=null){
	 id=new String(id.getBytes("ISO-8859-1"),"GB2312");}
	 else {id="0";}
	 
	 String content=null;
     content=request.getParameter("content");
	 if(content!=null){
	 content=new String(content.getBytes("ISO-8859-1"),"GB2312");}
	 else {content="0";}
	 
String sql=null;
ResultSet rs=null;

if(!content.equals("0"))
{
sql="update media_news set ne_content='"+content+"' where ne_id='"+id+"'";
conn.stmt.executeUpdate(sql);
out.print("<script>alert('修改成功');</script>");
}
sql="select * from media_news where ne_id='"+id+"'";
rs=conn.stmt.executeQuery(sql);
rs.next();
%>
<form action="?id=<%=id%>" method="post">
内容:<br>
<textarea cols="60" rows="15" name="content"><%=rs.getString(2)%></textarea><br>
<input type="submit" value="确定">
</form>
</body>
</html>