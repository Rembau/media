<%@page contentType="text/html; charset=GB2312" language="java" import="java.sql.*"%>
<jsp:useBean id="conn" class="javabean.Conn" scope="session"></jsp:useBean>
<html>
<head>
<title>���ϲ鿴</title>
<link href="../css/main_style.css" rel="stylesheet" type="text/css">
</head>
<body>
<%
Statement stmt=conn.getStmt();
Statement stmt1=conn.getStmt();
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
	 else id="0";
	 
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
%>
<%String  sql;
ResultSet rs;
sql="select * from media_fault where fa_state='�ѽ��' order by fa_time desc";
 rs=stmt.executeQuery(sql);%>
<span class="current"><font color="#F00">��ǰλ��:</font>�ѽ������</span><br>
	  <table width="100%" border="1" bordercolor="#CCCCCC">
	  <tr>
	  <th>���</th>
	  <th>λ��</th>
	  <th>����</th>
	  <th>�걨��ʦ</th>
	  <th>�걨ʱ��</th>
	  <th>�걨����</th>
	  <th>�鿴����</th>
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
			//out.print("<script>alert('���¼');window.location.href='landing.jsp';</script>");
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
	while(rs.next()&&j < pagenum){%><tr><td><%=k%></td><td><%=rs.getString(2)%></td>
	 <td><%int introom=Integer.parseInt(rs.getString(3));
sql="select * from media_site where sit_nummark='"+introom/1000+"'";
//out.print(sql);
ResultSet rs2=stmt1.executeQuery(sql);
rs2.next();
String floor2=rs2.getString(2);
%><%=floor2%>
<%=introom%1000%></td><td><%=rs.getString(6)%></td><td><%=rs.getString(7)%></td><td><%=rs.getString(9)%></td>
	 <td><a href="fault.jsp?id=<%=rs.getString(1)%>&page=<%=nowpage%>&markpage=1">����鿴��ϸ����</a></td> </tr>
	 
	<%k++;
	j++;
	}%>
	</table>
    <center>
<table width="400" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="100" align="center">��<%=nowpage%>ҳ</td>
    <td width="100" align="center"><%if(nowpage>1){%>
      <a href="?page=<%=nowpage-1%>">��һҳ</a>
      <%}%></td>
    <td width="100" align="center"><%if(nowpage<allpage){%>
      <a href="?page=<%=nowpage+1%>">��һҳ</a>
      <%}%></td>
    <td width="100" align="center">��<%=allpage%>ҳ</td>
  </tr>
</table>
</center>
<a href="faulthuifu.jsp">����</a>
</body></html>