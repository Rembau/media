<%@page contentType="text/html; charset=GB2312" language="java" import="java.sql.*"%>
<jsp:useBean id="conn" class="javabean.Conn" scope="session"></jsp:useBean>
<html>
<head>
<title>��������</title>
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
	sql="update media_fault set fa_state='��ȷ��' where fa_id='"+id+"'";
	stmt.executeUpdate(sql);
	sql="select * from media_fault where fa_id='"+id+"'";
	rs=stmt.executeQuery(sql);
	rs.next();
	//out.print(rs.getString(3));
	sql="update media_situation set si_nowstate ='����' where si_room='"+rs.getString(3)+"' and si_area='"+rs.getString(2)+"'";
	stmt.executeUpdate(sql);
	}
	else if(mark.equals("2")){
	sql="delete from media_fault where fa_id='"+id+"'";
	stmt.executeUpdate(sql);
	out.println("<script>alert('ɾ���ɹ�');window.location.href='faulthuifu.jsp';</script>");
	}%>
<% sql="select * from media_fault where fa_state='δ����'";
 rs=stmt.executeQuery(sql);%>
<%if(!id.equals("0")){
 sql="select * from media_fault where fa_id='"+id+"'";
 rs=stmt.executeQuery(sql);
	  while(rs.next()){%>
<span class="current"><font color="#F00">��ǰλ��:</font>��������</span><br>
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
	<td class="td_left">״̬:<%out.print(rs.getString(4));
	if(rs.getString(4).equals("δ����")){%>
	<a href="?id=<%=id%>&mark=1" onclick="return check('ȷ��')">&nbsp;ͨ��</a><%}%>
	&nbsp;&nbsp;<a href="?id=<%=id%>&mark=2"  onclick="return check('ȷ��ɾ��')">ɾ���˼�¼</a> 
	</td>
	</tr></table><br>
	<table border="1" width="100%">
	<tr>
	<td class="td_left">������ϸ���:<br>
		&nbsp;&nbsp;��λ��:<% out.print(rs.getString(14)+"<br>");
	  out.print("&nbsp;&nbsp;��������:"+rs.getString(5)+"<br>");
	  if(rs.getString(13)!=null){
	  out.print("&nbsp;&nbsp;����Ա����:"+rs.getString(13)+"<br>");
	  }
	%><a href="?page=<%=nowpage%>&make=2&id=<%=id%>">�����������</a><br>
	<%if(make.equals("2")){%>
	<form method="post" action="servlet.FaultExplain?id=<%=id%>&markpage=<%=markpage%>">
	���Ϲؼ���<select name="depart1">
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
	<input type="submit" value="ȷ��" onclick="return check('ȷ���ύ')"></form><%}%>
	</td>
	</tr>
	</table>
	
	<br>
	<table width="100%" border="1">
	<tr><td class="td_left">����취:<%=rs.getString(10)%><br><a href="?page=<%=nowpage%>&make=1&id=<%=id%>">�ύ����취</a>
	<%if(make.equals("1")){%>
	<form method="post" action="servlet.FaultSolve?id=<%=id%>&markpage=<%=markpage%>">
	<textarea name="solve" rows="10" cols="50"></textarea><br>
	<input type="submit" value="ȷ��" onclick="return check('ȷ���ύ')">(ȷ�������ѽ��ʱ���ȷ��,������ɳ�ͻ)</form>
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
	<a href="<%=url%>">����</a>
</body>
</html>