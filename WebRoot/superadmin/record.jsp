<%@page contentType="text/html; charset=GB2312" language="java" import="java.sql.*"%>
<jsp:useBean id="conn" class="javabean.Conn" scope="session"></jsp:useBean>
<html>
<head>
<title>��¼</title>
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
<%
String id=null;
     id=request.getParameter("id");
	 if(id!=null){
	 id=new String(id.getBytes("ISO-8859-1"),"GB2312");}
	 else {id="0";}

	 
String sql="select * from media_adminrecord order by adr_id desc";
ResultSet rs=conn.stmt.executeQuery(sql);%>
 <table width="100%" border="1" bordercolor="#CCCCCC">
	  <tr>
	  <th>���</th>
	  <th>��¼��</th>
	  <th>����</th>
	  <th>ʱ��</th>
	  <th>��ϸ</th>
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
	while(rs.next()&&j < pagenum){%>
	<tr onMouseOver="javascript:this.bgColor='#efefef'" onMouseOut="javascript:this.bgColor='#ffffff'">
	 <td><%=k%></td>
	 <td><%=rs.getString(2)%></td>
	 <td><%=rs.getString(4)%></td>
	 <td><%=rs.getString(6)%></td>
	 <td><a href="?id=<%=rs.getString(1)%>&page=<%=nowpage%>">����鿴��ϸ����</a></td> 
   </tr>
	 
	<%k++;
	j++;
	}%>
</table>
    <center>
	<table width="400" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td align="center">��<%=nowpage%>ҳ </td>
        <td align="center"><%if(nowpage>1){%>
          <a href="?page=<%=nowpage-1%>&id=<%=id%>">��һҳ</a>
        <%}%></td>
        <td align="center"><%if(nowpage<allpage){%>
          <a href="?page=<%=nowpage+1%>&id=<%=id%>">��һҳ</a>
          <%}%></td>
        <td align="center">��<%=allpage%>ҳ</td>
		<td></td>
      </tr>
    </table>
	</center>
	<%if(!id.equals("0")){
	 sql="select * from media_adminrecord where adr_id='"+id+"'";
	 rs=conn.stmt.executeQuery(sql);
	 rs.next();
	 out.print(rs.getString(2)+"�ļ�¼: "+rs.getString(3));
	 }
	%><br>
</body>
</html>