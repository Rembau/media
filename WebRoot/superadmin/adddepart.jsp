<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'adddepart.jsp' starting page</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="../css/main_style.css">

  </head>
  
  <body>
  <span class="bg">
    	<form action="/media/servlet/DepartmentAlert?mark=2" method="post">
    	要添加的部门的名称：<input type="text" name="name"><br>
    	<input type="submit" value="提交"> 
    	</form>
    </span>
  </body>
</html>
