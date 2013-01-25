<%@page contentType="text/html; charset=GB2312" language="java" import="java.sql.*"%>
<jsp:useBean id="conn" class="javabean.Conn" scope="session"></jsp:useBean>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>部门管理</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="../css/main_style.css">
  </head>
  
  <body>
<%
ResultSet rs;
String sql = "select * from media_department"; 
rs = conn.stmt.executeQuery(sql);
%>
<span class="bg">
<table>
<tr>
<th>序号</th><th>部门</th><th>操作</th>
<%
int i=1;
while(rs.next())
{
	out.println("<tr>");
	out.println("<td>"+(i++)+"</td><td>"+rs.getString("de_name")+"</td>");
	out.println("<td><a href=\"departmentalter.jsp?mark="+rs.getString("de_name")+"\">修改</a></td>");
	out.println("<td><a href=\"/media/servlet/DepartmentAlert?mark=3&name="+rs.getString("de_name")+"\" onclick=\"return check()\" >删除</a></td>");
	out.println("</tr>");
} 
%>
</tr>
</table>
<a href="adddepart.jsp">添加部门</a>
</span>
<script type="text/javascript">
function check()
{
	if(!window.confirm('确定删除？'))
	{
		return false;
	}
}

</script>
  </body>
</html>
