<%@page contentType="text/html; charset=GB2312" language="java" import="java.sql.*"%>
<jsp:useBean id="conn" class="javabean.Conn" scope="session"></jsp:useBean>
<html>
<HEAD>
<TITLE>�޸���Ϣ</TITLE>
<link href="css/main_style.css" rel="stylesheet" type="text/css">
</HEAD>
<body>
<span class="current"><font color="#F00">��ǰλ��:</font>������Ϣ</span>
<br>
<script Language="Javascript" src="form.js"></Script>
<span class="bg">
<form name="change" action=".Changeany" method="post">
�����Լ�����:
<input type="text" name="name" style="width:150px" maxlength="20"><br>
���ĵ绰����:
<input type="text" name="telephone" style="width:150px" maxlength="20"><br>
���������ַ:
<input type="text" name="mail" style="width:150px" maxlength="20">
<br>
��������Ժϵ:
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
<input type="submit" value="ȷ��">
</form> 
<font color="#F00"> ע��:</font>������Ϣ���´ε�¼��Ч!
</span>
</body>
</html>
