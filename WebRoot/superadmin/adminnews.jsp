<%@page contentType="text/html; charset=GB2312" language="java" import="java.sql.*"%>
<jsp:useBean id="conn" class="javabean.Conn" scope="session"></jsp:useBean>
<html>
<head>
<link rel="Shortcut Icon" href="../ico/1.ico">
<title>��������</title>
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

  <table width="100%" border="1" bordercolor="#CCCCCC">
	  <tr>
	  <th width="40">���</th>
	  <th>����</th>
	  <th width="150">�걨ʱ��</th>
	  <th width="30">����</th>
	  </tr>
	  <%
String sql;
ResultSet rs;
	   sql="select * from media_adminnews";
 rs=conn.stmt.executeQuery(sql);%>
	  <%int xuhao=1;
	  int pagenum = 12;
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
	while(rs.next()&&j < pagenum){%>
	<tr onMouseOver="javascript:this.bgColor='#efefef'" onMouseOut="javascript:this.bgColor='#ffffff'">
	<td><%=k%></td>
	<td class="td_left"><%=rs.getString(2)%></td>
	<td><%=rs.getString(3)%></td><td><a href="updataadmin.jsp?id=<%=rs.getString(1)%>">�޸�</a></td>
	</tr>
	 
	<%k++;
	j++;
	}%>
	</table>
	<center>
	<table>
	<tr><td>��<%=nowpage%>ҳ </td>
	<td><%if(nowpage>1){%><a href="?page=<%=nowpage-1%>">��һҳ</a><%}%></td>
	<td><%if(nowpage<allpage){%><a href="?page=<%=nowpage+1%>">��һҳ</a><%}%></td>
	<td>��<%=allpage%>ҳ</td><td></td></tr>
	</table>
	</center>
	<a href="news.jsp">����</a>
</body>
	</html>