<%@ page language="java" import="java.util.*" contentType="text/html; charset=gb18030"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head> 
    <title>My JSP 'activation.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    <link href="../css/main_style.css" rel="stylesheet" type="text/css">
  </head>
  <script type="text/javascript">
  function check(){
     if(document.form1.code.value==''){
        alert('���벻��Ϊ��!');
        return false;
     }
     return true;
  }
  </script>
  <body> 
    �������ý��ʹ��֤��:<br>
    <form action=".Activation" method="post" name ="form1">
    <input type="text" name = "code"><br>
    <input type="submit" value="ȷ��" onClick="return check()">
    </form>
  </body>
</html>
