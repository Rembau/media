<%@page contentType="text/html; charset=GB2312" language="java" import="java.sql.*"%>
<jsp:useBean id="conn" class="javabean.Conn" scope="session"></jsp:useBean>
<html>
<head>
<title>����Ҫ��ظ�</title>
<link href="../css/main_style.css" rel="stylesheet" type="text/css">
</head>
<body>
<span class="current"><font color="#F00">��ǰλ��:</font>����ظ�</span>
<%
Object num=session.getAttribute("num");
Object name=session.getAttribute("name");
Object depart=session.getAttribute("depart");
Object intweek=session.getAttribute("intweek");
Object intweekday=session.getAttribute("intweekday");
Object intmonth=session.getAttribute("intmonth");
Object intday=session.getAttribute("intday");

%><p>
</p>
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
<% String sql="select * from media_suggestion order by su_time desc";
ResultSet rs=conn.stmt.executeQuery(sql);%>
<table width="100%" border="1" bordercolor="#CCCCCC">
	  <tr>
	  <th>���</th>
	  <th>����</th>
	  <th>��ʦ</th>
	  <th>����</th>
	  <th>ʱ��</th>
	  <th>�绰</th>
	  <th>����</th>
	  <th>״̬</th>
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
	while(rs.next()&&j < pagenum){%><tr onMouseOver="javascript:this.bgColor='#efefef'" onMouseOut="javascript:this.bgColor='#ffffff'">
	 <td><%=k%></td><td><%=rs.getString(6)%></td>
	 <td><%=rs.getString(2)%></td><td class="td_left"><%=rs.getString(3)%></td><td><%=rs.getString(5)%></td><td><%=rs.getString(7)%></td>
	 <td><%=rs.getString(8)%></td><td><%=rs.getString(10)%></td> <td><a href="suggestion.jsp?id=<%=rs.getString(1)%>&mark=1">�鿴����</a></td></tr>
	 
	<%k++;
	j++;
	}%>
</table>
<center>
<table width="400" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="100" align="center">��<%=nowpage%>ҳ </td>
    <td width="100" align="center"><%if(nowpage>1){%>
      <a href="?page=<%=nowpage-1%>&id=<%=id%>">��һҳ</a>
      <%}%></td>
    <td width="100" align="center"><%if(nowpage<allpage){%>
      <a href="?page=<%=nowpage+1%>&id=<%=id%>">��һҳ</a>
      <%}%></td>
    <td width="100" align="center">��<%=allpage%>ҳ</td>
  </tr>
</table>
</center>


</body>
</html>