<%@page contentType="text/html; charset=GB2312" language="java" import="java.sql.*"%>
<jsp:useBean id="conn" class="javabean.Conn" scope="session"></jsp:useBean>
<html>
<HEAD>
<TITLE>修改信息</TITLE>
<link href="css/main_style.css" rel="stylesheet" type="text/css">
</HEAD>
<body>
<span class="current"><font color="#F00">当前位置:</font>更改信息</span>
<br>
<script Language="Javascript" src="form.js"></Script>
<span class="bg">
<form name="change" action=".Changeany" method="post">
更改自己姓名:
<input type="text" name="name" style="width:150px" maxlength="20"><br>
更改电话号码:
<input type="text" name="telephone" style="width:150px" maxlength="20"><br>
更改邮箱地址:
<input type="text" name="mail" style="width:150px" maxlength="20">
<br>
更改所属院系:
<select name="depart"> 
<option></option>
<%
ResultSet rs;
String sql = "select * from media_department"; 
rs = conn.stmt.executeQuery(sql);
while(rs.next())
{
out.println("<option>"+rs.getString("de_name")+"</option>");
} %>
</select>
<br>
<input type="submit" value="确定">
</form> 
<font color="#F00"> 注意:</font>更改信息在下次登录有效!
</span>
</body>
</html>
