<%@page contentType="text/html; charset=GB2312" language="java" import="java.sql.*"%>
<jsp:useBean id="conn" class="javabean.Conn" scope="session"></jsp:useBean>
<html>
<head>
<title>注册</title>
<link rel="Shortcut Icon" href="../ico/1.ico">
<link href="../css/main_style.css" rel="stylesheet" type="text/css">
</head>
<body alink=""> 
<span class="current"><font color="#F00">当前位置:</font>添加用户</span><br>
<span class="bg">
<form method="post" action=".AddUser" name="form">
<input type="text" name="num" />   工号(必填)<br>
<input type="text" name="name" />   真实姓名(必填)<br>
<select name="depart"> 
<%
ResultSet rs;
String sql = "select * from media_department"; 
rs = conn.stmt.executeQuery(sql);
while(rs.next())
{
out.println("<option>"+rs.getString("de_name")+"</option>");
} %>
<option>无</option>
</select>   
院系部门<br>
<select name="mark">
<option>教师</option>
<option>管理员</option>
<option>非教学申请用户</option>
</select><br>
<input type="text" name="telephone" />   电话号码<br>
<input type="text" name="mail" />   邮箱<br>
<input type="submit" value="确定" onClick="return check()">
<input type="reset" value="清除">&nbsp;&nbsp;<a href="guanliuser.jsp">返回</a>
</form></span>

<script type="text/javascript">
function check()
{
	if(document.form.num.value=='' || document.form.name.value=='')
	{
		alert("工号或姓名不能为空!");
		window.location.reload();
		return false;
		}
	}
</script>
</body>
</html>