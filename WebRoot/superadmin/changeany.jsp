<%@ page contentType="text/html;charset=GB2312" import="java.sql.*"%>
<html>
<HEAD>
<TITLE>修改信息</TITLE>
<link href="../css/main_style.css" rel="stylesheet" type="text/css">
<jsp:useBean id="conn" class="javabean.Conn" scope="session"></jsp:useBean>
</HEAD>
<body>
<span class="current"><font color="#F00">当前位置:</font>更改信息</span>
<br>
<script Language="Javascript" src="form.js"></Script>
<%
  String id=null;
  id=request.getParameter("id");
 if(id!=null){
 id=new String(id.getBytes("ISO-8859-1"));
 }
 else { id="0";}
 
 String sql="select * from media_users where user_id='"+id+"'";
 ResultSet rs=conn.stmt.executeQuery(sql);
 rs.next();
%>
<span class="bg">
更改用户帐号:<%=rs.getString(2)%>
<form name="change" action="changeanyruku.jsp?id=<%=id%>" method="post">
更改用户姓名:
<input type="text" name="username" style="width:150px" maxlength="20" value="<%=rs.getString(4)%>"><br>
更改电话号码:
<input type="text" name="telephone" style="width:150px" maxlength="20" value="<%=rs.getString(7)%>"><br>
更改邮箱地址:
<input type="text" name="mail" style="width:150px" maxlength="20" value="<%=rs.getString(8)%>"><br>
更改帐号属性:
<select name="type">
<option value="教师">教师</option>
<option value="管理员">管理员</option>
<option value="非教学申请用户">非教学申请用户</option>
</select><br>
更改所属院系:
<select name="depart"> 
<%
String userdepart=rs.getString(5);
sql = "select * from media_department"; 
rs = conn.stmt.executeQuery(sql);
while(rs.next())
{
%> 
<option <%if(userdepart.equals(rs.getString("de_name"))) 
out.print("selected");%> value="'<%=rs.getString("de_name") %>'"><%=rs.getString("de_name") %></option>
<%
}
%>
</select> (若无需更改请勿选此项)<br>

<input type="submit" value="确定">
</form> 
</span>
</body>
</html>
