<%@page contentType="text/html; charset=GB2312" language="java" import="java.sql.*"%>
<jsp:useBean id="conn" class="javabean.Conn" scope="session"></jsp:useBean>
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
  <%
  String usernum=null;
     usernum=request.getParameter("usernum");
	 if(usernum!=null){
	 	usernum=new String(usernum.getBytes("ISO-8859-1"),"GB2312");
	 }
	 else {usernum="0";}
	 
   %>
  <body>
      <form action=".ChangeCourse?mark=2" method="post" name="form1">
    <span class="bg">
    ����
    <input type="text" onchange="return getName(this.value)" onkeydown="return KeyDown()">
    <%
    if(!usernum.equals("0")){
    	String sql="select * from media_users where user_num='"+usernum+"'";
		ResultSet rs=conn.stmt.executeQuery(sql);
		if(rs.next())
		{
			out.println("<br>���ţ�"+rs.getString("user_num"));
			out.println("<br>������"+rs.getString("user_name"));
			out.println("<input type=\"hidden\" name=\"num\" value=\""+rs.getString("user_num")+"\">");
			out.println("<input type=\"hidden\" name=\"name\" value=\""+rs.getString("user_name")+"\">");
		} else  
		{
			out.println("û�иù���");
		}
	}
		 %>
	<br>
	�γ�
	<input type="text" name="courseName"><br>
	�γ̺�
	<input type="text" name="courseCode"><br>
	��ʱ
	<input type="text" name="courseNum"><br>
	<input type="submit" value="�ύ">
    </span>
<script type="text/javascript">
function check()
{
	if(document.form1.courseName.value=='' || document.form1.courseCode.value ||document.form1.courseNum.value
	||document.form1.courseName.value)
	{
		alert('��Ϣ����д������');
		return false;
	}
	if(!window.confirm('ȷ���ύ��'))
	{
		return false;
	}
}
function getName(num)
{
	window.location.href='?usernum='+num+'';
}
function KeyDown(){ 
	if (event.keyCode==13)
	event.returnValue=false;
}
</script>
  </body>
</html>
