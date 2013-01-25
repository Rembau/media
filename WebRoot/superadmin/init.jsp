<%@page contentType="text/html; charset=GB2312" language="java"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'init.jsp' starting page</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="../css/main_style.css">

  </head>
  
  <body>
    <span class="bg">
    慎重操作，请在备份，记录保存完毕进行初始化操作。
    </span>
    <span class="bg">
    <form action=".InitWeb" method="post">
    <input type="checkbox" name="init" value="1" checked="checked"/>
    	删除申请记录<br/>
	<input type="checkbox" name="init" value="2" />
		删除课时记录<br/>
	<input type="checkbox" name="init" value="3" />
		删除提醒<br/>
	<input type="checkbox" name="init" value="4" />
		删除管理员记录<br/>
    <input type="submit" value="提交">
    </form>
    </span>
  </body>
</html>
