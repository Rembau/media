<%@page contentType="text/html; charset=GB2312" language="java" import="java.sql.*"%>
<jsp:useBean id="conn" class="javabean.Conn" scope="session"></jsp:useBean>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'chengecourse.jsp' starting page</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="../css/main_style.css">

  </head>
  
  <body>
  <span class="bg">
    <%
     String id=null;
     id=request.getParameter("id");
	 if(id!=null){
	 	id=new String(id.getBytes("ISO-8859-1"),"GB2312");}
	 else {id="0";}
	 String sql="select * from media_course where co_id="+id;
	 ResultSet rs = conn.stmt.executeQuery(sql);
	 if(rs.next())
	 {
	 %>
	 <form action=".ChangeCourse?mark=1" method="post">
	 <%	 
	 out.print("���ţ�"+rs.getString("co_num"));
	 out.print("������"+rs.getString("co_name")); %>
	 <input type="hidden" name="id" value=<%=rs.getString("co_id") %>><br>
	 �γ���<input type="text" name="courseName" value="<%=rs.getString("co_courseName") %>"><br>
	 �γ̺�<input type="text" name="courseCode" value="<%=rs.getString("co_courseCode") %>"><br>
	 ��ʱ&nbsp;
	 <input type="text" name="courseNum" value="<%=rs.getString("co_courseNum") %>"><br>
	 <input type="submit" value="�ύ">
	 <%
	 }
    %>
    </span>
  </body>
</html>
