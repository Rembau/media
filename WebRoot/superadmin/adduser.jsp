<%@page contentType="text/html; charset=GB2312" language="java" import="java.sql.*"%>
<jsp:useBean id="conn" class="javabean.Conn" scope="session"></jsp:useBean>
<html>
<head>
<title>ע��</title>
<link rel="Shortcut Icon" href="../ico/1.ico">
<link href="../css/main_style.css" rel="stylesheet" type="text/css">
</head>
<body alink=""> 
<span class="current"><font color="#F00">��ǰλ��:</font>����û�</span><br>
<span class="bg">
<form method="post" action=".AddUser" name="form">
<input type="text" name="num" />   ����(����)<br>
<input type="text" name="name" />   ��ʵ����(����)<br>
<select name="depart"> 
<%
ResultSet rs;
String sql = "select * from media_department"; 
rs = conn.stmt.executeQuery(sql);
while(rs.next())
{
out.println("<option>"+rs.getString("de_name")+"</option>");
} %>
<option>��</option>
</select>   
Ժϵ����<br>
<select name="mark">
<option>��ʦ</option>
<option>����Ա</option>
<option>�ǽ�ѧ�����û�</option>
</select><br>
<input type="text" name="telephone" />   �绰����<br>
<input type="text" name="mail" />   ����<br>
<input type="submit" value="ȷ��" onClick="return check()">
<input type="reset" value="���">&nbsp;&nbsp;<a href="guanliuser.jsp">����</a>
</form></span>

<script type="text/javascript">
function check()
{
	if(document.form.num.value=='' || document.form.name.value=='')
	{
		alert("���Ż���������Ϊ��!");
		window.location.reload();
		return false;
		}
	}
</script>
</body>
</html>