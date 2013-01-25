<%@ page language="java" import="java.util.*" pageEncoding="gb18030"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'changehelp.jsp' starting page</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
<link href="../css/main_style.css" rel="stylesheet" type="text/css">
  </head>
  <%
  String mark=null;
     mark=request.getParameter("mark");
	 if(mark!=null){
	 mark=new String(mark.getBytes("ISO-8859-1"),"GB2312");}
	 else {mark="0";}
   %>
  <body>
  <span class="bg">
  <%
  if(mark.equals("1")){
     out.println("修改教师帮助");
  }
  else if(mark.equals("2")){
     out.println("修改管理员帮助");
  } 
  else out.println("修改超级管理员帮助");
  %>
  <br>
    <form action='.ChangeHelp?mark=<%=mark %>' method=post>
    <textarea rows="20" cols="50" name="content"></textarea><br>
    <input type=submit value="确定">
    </form>
    </span>
  </body>
</html>
