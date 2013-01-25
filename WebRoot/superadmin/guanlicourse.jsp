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
  <body>
  <%
	 String username=null;
     username=request.getParameter("username");
	 if(username!=null && username.length()!=0){
	 username=new String(username.getBytes("ISO-8859-1"),"GB2312");
	 }
	 else {username="";}
	 
 	 String usernum=null;
     usernum=request.getParameter("usernum");
	 if(usernum!=null && usernum.length()!=0){
	 usernum=new String(usernum.getBytes("ISO-8859-1"),"GB2312");
	 }
	 else {usernum="";}
	 %>
	 <form action="#" type="post">
	 姓名<input type="text" name="username" value="<%=username%>">(如:张)&nbsp;&nbsp;
	 工号<input type="text" name="usernum" value="<%=usernum%>">&nbsp;&nbsp;
	 <input type="submit" value="确定">
  <span class="bg">
  <table width="100%" border="1" bordercolor="#CCCCCC">
<tr>
<th>序号</th><th>工号</th><th>姓名</th>
<th>课程</th><th>课程号</th><th>课时</th>
<th>已用</th><th>操作</th>
<%
 Statement stmt1=conn.getStmt();
	int pagenum=30;
	int pagenow=1;
	request.setCharacterEncoding("gbk");
	String currentpagestr = request.getParameter("page");
	if(currentpagestr != null)
		pagenow=Integer.parseInt(currentpagestr);
	ResultSet rs;
	int s=(pagenow-1)*pagenum;
	
	String strusername="",strusernum="";
	if(!username.equals("")){
		strusername="and co_name like '"+username+"%'";
	}
	if(!usernum.equals("")){
		strusernum="and co_num like '"+usernum+"%'";
	}
	String sql = "select * from media_course where 1=1 "+strusername+" "+strusernum+" limit "+s+","+(pagenum+1); 
	System.out.println(sql);
	rs = conn.stmt.executeQuery(sql);
	rs.last();
	boolean mark= rs.getRow()>pagenum;
	rs.beforeFirst();
	int i=s+1;
	int j=1;
	while(rs.next() && (j++)<=pagenum)
	{
	out.println("<tr>");
	out.println("<td>"+(i++)+"</td>");
	out.println("<td>"+rs.getString(1)+"</td>");
	out.println("<td>"+rs.getString(2)+"</td>");
	out.println("<td>"+rs.getString(3)+"</td>");
	out.println("<td>"+rs.getString(4)+"</td>");
	out.println("<td>"+rs.getString(5)+"</td>");
	ResultSet rs1 = stmt1.executeQuery(
	"select * from sqcount where ap_num='"+rs.getString("co_num")+"' and ap_courseName='"+rs.getString("co_courseName")+"'");
	if(rs1.next())
	{
		out.println("<td>"+rs1.getString(1)+"</td>");
	} else
	{
		out.println("<td>0</td>");
	}
	out.println("<td><a href=\"chengecourse.jsp?id="+rs.getString("co_id")+"\">修改</a></td>");
	out.println("<td><a href=\".ChangeCourse?mark=3&id="+rs.getString("co_id")+"\" onclick=\"return check()\">删除</a></td>");
	out.println("</tr>");
	}  
%>
</tr>
<tr><td></td><td>
<%if(pagenow>1) { %>
<a href="?page=<%=pagenow-1 %>">上一页</a><%} %>
</td><td></td><td>
<%if(mark) { %>
<a href="?page=<%=pagenow+1 %>">下一页</a><%} %>
</td><td></td></tr>
</table>
   		<a href="daorucourse.jsp">导入课时表</a> &nbsp;&nbsp;
   		<a href="addcourse.jsp">添加课时</a>
</span>
<script type="text/javascript">
function check(){
if(window.confirm('确定删除吗？')){
	return true;
}
return false;
}
</script>
</body>
</html>
