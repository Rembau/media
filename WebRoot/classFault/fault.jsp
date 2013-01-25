<%@page contentType="text/html; charset=GB2312" language="java" import="java.sql.*"%>
<jsp:useBean id="conn" class="javabean.Conn" scope="session"></jsp:useBean>
<html>
<head>
<title>故障详情</title>
<link href="../css/main_style.css" rel="stylesheet" type="text/css">
</head>
<script type="text/javascript">
function check(mark){
    if(window.confirm(mark)){
         return true;
    }
    else return false;
}
</script>
<body>
<%
Statement stmt=conn.getStmt();
Statement stmt1=conn.getStmt();
%>
<%String id=null;
     id=request.getParameter("id");
	 if(id!=null){
	 id=new String(id.getBytes("ISO-8859-1"),"GB2312");}
	 else id="0";

String nowpage=null;
     nowpage=request.getParameter("page");
	 if(nowpage!=null){
	 nowpage=new String(nowpage.getBytes("ISO-8859-1"),"GB2312");}
	 else {nowpage="0";}

String mark=null;
     mark=request.getParameter("mark");
	 if(mark!=null){
	 mark=new String(mark.getBytes("ISO-8859-1"),"GB2312");}
	 else mark="0";
	 
	 String make=null;
     make=request.getParameter("make");
	 if(make!=null){
	 make=new String(make.getBytes("ISO-8859-1"),"GB2312");}
	 else {make="0";}
	 
String markpage=null;
     markpage=request.getParameter("markpage");
	 if(markpage!=null){
	 markpage=new String(markpage.getBytes("ISO-8859-1"),"GB2312");}
	 else {markpage="0";}

	 %>
<%String  sql;
ResultSet rs;
if(mark.equals("1")){
	sql="update media_fault set fa_state='已确认' where fa_id='"+id+"'";
	stmt.executeUpdate(sql);
	sql="select * from media_fault where fa_id='"+id+"'";
	rs=stmt.executeQuery(sql);
	rs.next();
	//out.print(rs.getString(3));
	sql="update media_situation set si_nowstate ='故障' where si_room='"+rs.getString(3)+"' and si_area='"+rs.getString(2)+"'";
	stmt.executeUpdate(sql);
	}
	else if(mark.equals("2")){
	sql="delete from media_fault where fa_id='"+id+"'";
	stmt.executeUpdate(sql);
	out.println("<script>alert('删除成功');window.location.href='faulthuifu.jsp';</script>");
	}%>
<% sql="select * from media_fault where fa_state='未处理'";
 rs=stmt.executeQuery(sql);%>
<%if(!id.equals("0")){
 sql="select * from media_fault where fa_id='"+id+"'";
 rs=stmt.executeQuery(sql);
	  while(rs.next()){%>
<span class="current"><font color="#F00">当前位置:</font>故障详情</span><br>
<%int introom=Integer.parseInt(rs.getString(3));
sql="select * from media_site where sit_nummark='"+introom/1000+"'";
//out.print(sql);
ResultSet rs2=stmt1.executeQuery(sql);
rs2.next();
String floor2=rs2.getString(2);
%>
<span class="bg"><%=rs.getString(2)%>
<%=floor2%>
<%=introom%1000%></span>
<table border="1" width="100%">
	<tr>
	<td class="td_left">状态:<%out.print(rs.getString(4));
	if(rs.getString(4).equals("未处理")){%>
	<a href="?id=<%=id%>&mark=1" onclick="return check('确认')">&nbsp;通过</a><%}%>
	&nbsp;&nbsp;<a href="?id=<%=id%>&mark=2"  onclick="return check('确认删除')">删除此记录</a> 
	</td>
	</tr></table><br>
	<table border="1" width="100%">
	<tr>
	<td class="td_left">故障详细情况:<br>
		&nbsp;&nbsp;损坏位置:<% out.print(rs.getString(14)+"<br>");
	  out.print("&nbsp;&nbsp;故障描述:"+rs.getString(5)+"<br>");
	  if(rs.getString(13)!=null){
	  out.print("&nbsp;&nbsp;管理员补充:"+rs.getString(13)+"<br>");
	  }
	%><a href="?page=<%=nowpage%>&make=2&id=<%=id%>">故障情况补充</a><br>
	<%if(make.equals("2")){%>
	<form method="post" action="servlet.FaultExplain?id=<%=id%>&markpage=<%=markpage%>">
	故障关键字<select name="depart1">
	<%sql="select * from media_mediadepart";
	ResultSet rs1=stmt1.executeQuery(sql);
	while(rs1.next()){%>
	<option><%=rs1.getString(2)%></option>
	<%}%>
	</select><br>
	<textarea name="add" rows="10" cols="50">
	<%if(rs.getString(13)!=null){
	  out.print(rs.getString(13));
	  }%></textarea><br>
	<input type="submit" value="确认" onclick="return check('确认提交')"></form><%}%>
	</td>
	</tr>
	</table>
	
	<br>
	<table width="100%" border="1">
	<tr><td class="td_left">解决办法:<%=rs.getString(10)%><br><a href="?page=<%=nowpage%>&make=1&id=<%=id%>">提交解决办法</a>
	<%if(make.equals("1")){%>
	<form method="post" action="servlet.FaultSolve?id=<%=id%>&markpage=<%=markpage%>">
	<textarea name="solve" rows="10" cols="50"></textarea><br>
	<input type="submit" value="确认" onclick="return check('确认提交')">(确保问题已解决时点击确认,以免造成冲突)</form>
	<%}%><%}%>
	</td></tr>
</table><%}%>
	<%
	String url;
	if(markpage.equals("0"))
	url="faulthuifu.jsp";
	else if(markpage.equals("1"))
	url="overfault.jsp";
	else url="allfaultclass.jsp";
	
	%>
	<a href="<%=url%>">返回</a>
</body>
</html>