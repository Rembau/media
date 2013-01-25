<%@page contentType="text/html; charset=GB2312" language="java" import="java.sql.*"%>

<jsp:useBean id="conn" class="javabean.Conn" scope="session"></jsp:useBean>

<html>
<head>
<title>建议要求回复</title>
<link href="../css/main_style.css" rel="stylesheet" type="text/css">
</head>
<body>
<%
Object num=session.getAttribute("num");
Object name=session.getAttribute("name");
Object depart=session.getAttribute("depart");
Object intweek=session.getAttribute("intweek");
Object intweekday=session.getAttribute("intweekday");
Object intmonth=session.getAttribute("intmonth");
Object intday=session.getAttribute("intday");
%>
<%String id=null;
     id=request.getParameter("id");
	 if(id!=null){
	 id=new String(id.getBytes("ISO-8859-1"),"GB2312");}
	 
	 String mark=null;
     mark=request.getParameter("mark");
	 if(mark!=null){
	 mark=new String(mark.getBytes("ISO-8859-1"),"GB2312");}
	 else mark="0";
%>
<% String sql="select * from media_suggestion";
ResultSet rs=conn.stmt.executeQuery(sql);%>
<table width="884" border="0" style="empty-cells:show; border-collapse:collapse;">
  <tr>
    <td width="625" valign="top" >
	  <table width="641" border="1" style="empty-cells:show; border-collapse:collapse;">
	    <tr><td width="28">序号</td>
	  <td width="28">工号</td>
	  <td width="66">教师</td>
	  <td width="51">主题</td>
	  <td width="70">时间</td>
	  <td width="79">电话</td>
	  <td width="92">邮箱</td>
	  <td width="93">状态</td>
	  <td width="60">查看内容</td>
	  </tr>
	  <%int xuhao=1;
	  int pagenum = 9;
			int nowpage=1;
			String currentpagestr = null;
			int allpage=1;
			int all;
					request.setCharacterEncoding("gbk");
			currentpagestr = request.getParameter("page");
			if (currentpagestr != null)
				//nowpage = Integer.valueOf(currentpagestr); 
				nowpage=Integer.parseInt(currentpagestr);
				//if(nowpage==0)
			//out.print("<script>alert('请登录');window.location.href='landing.jsp';</script>");
			rs.last();
			all= rs.getRow();
			allpage=(all-1)/pagenum +1;
			rs.beforeFirst();
			int i=(nowpage-1)*pagenum;
			int k=i+1;
			while(i>0){
			rs.next();
			i--;}
	    
	  %>
	<%int j=0;
	while(rs.next()&&j < pagenum){%><tr><td><%=k%></td><td><%=rs.getString(6)%></td>
	 <td><%=rs.getString(2)%></td><td><%=rs.getString(3)%></td><td><%=rs.getString(5)%></td><td><%=rs.getString(7)%></td>
	 <td><%=rs.getString(8)%></td><td><%=rs.getString(10)%></td> <td><a href="?id=<%=rs.getString(1)%>&mark=1">查看内容</a></td></tr>
	 
	<%k++;
	j++;
	}%>
	<tr><td></td><td></td><td>第<%=nowpage%>页 </td><td></td>
	<td><%if(nowpage>1){%><a href="?page=<%=nowpage-1%>&id=<%=id%>">上一页</a><%}%></td>
	<td><%if(nowpage<allpage){%><a href="?page=<%=nowpage+1%>&id=<%=id%>">下一页</a><%}%></td><td></td>
	<td>共<%=allpage%>页</td>
	<td></td></tr>
</table>
<%if(mark.equals("1")){
sql="select * from media_suggestion where su_id='"+id+"'";
rs=conn.stmt.executeQuery(sql);
rs.next();
%><td width="249" valign="top"><table border="1"><tr><td>建议或要求内容:<%=rs.getString(4)%><br><%if(rs.getString(10).equals("没有回复")){%><form method="post" action="suggestionhuifuruku.jsp?id=<%=id%>" name="suggestionhuifu"><textarea name="reply" rows="10" cols="40"></textarea><input type="submit" value="回复"></form><%} else {%> 回复内容:<%=rs.getString(9)%><%}%></td></tr></table></td><%}%> 
  </tr></table>
<a href="superadmin.jsp">返回</a>
</body>
</html>