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
    ���ز��������ڱ��ݣ���¼������Ͻ��г�ʼ��������
    </span>
    <span class="bg">
    <form action=".InitWeb" method="post">
    <input type="checkbox" name="init" value="1" checked="checked"/>
    	ɾ�������¼<br/>
	<input type="checkbox" name="init" value="2" />
		ɾ����ʱ��¼<br/>
	<input type="checkbox" name="init" value="3" />
		ɾ������<br/>
	<input type="checkbox" name="init" value="4" />
		ɾ������Ա��¼<br/>
    <input type="submit" value="�ύ">
    </form>
    </span>
  </body>
</html>
