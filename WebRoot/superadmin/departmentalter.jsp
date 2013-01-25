<%@page contentType="text/html; charset=GB2312" language="java" import="java.sql.*"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title></title>

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
  String mark=null;
     mark=request.getParameter("mark");
	 if(mark!=null){
	 mark=new String(mark.getBytes("ISO-8859-1"),"GB2312");}
	 else {mark="0";}
	 out.println(mark);
   %>
   <form action="/media/servlet/DepartmentAlert?mark=1" method="post">
   请输入要修改的部门名称：<br>
   <input type="text" name="depart"><br>
   <input type="hidden" name="old" value="<%=mark %>">
   <input type="submit" value="确认"> 
   </form>
   </span>
  </body>
</html>
