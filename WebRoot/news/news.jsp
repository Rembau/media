<%@page contentType="text/html; charset=GB2312" language="java" import="java.sql.*,java.text.SimpleDateFormat,java.util.Date"%>
<jsp:useBean id="conn" class="javabean.Conn" scope="session"></jsp:useBean>
<html>
<head>
<title>����</title>
<link href="../css/main_style.css" rel="stylesheet" type="text/css">
</head>
<body>
<span class="current"><strong>��ǰλ��:</strong>��ͨ����</span>
<br>
<span class="bg">
<%
Object num=session.getAttribute("num");
Object name=session.getAttribute("name");
Object depart=session.getAttribute("depart");
Object intweek=session.getAttribute("intweek");
Object intweekday=session.getAttribute("intweekday");
Object intmonth=session.getAttribute("intmonth");
Object intday=session.getAttribute("intday");
%>
<% String sql="select * from media_news order by ne_id desc";
  ResultSet rs=conn.stmt.executeQuery(sql);
%>
����:
<table width="100%" border="1" bordercolor="#CCCCCC" style="empty-cells:show; border-collapse:collapse;" align="left">
	    <tr><th>���</th>
	  <th>����</th>
	  <th>ʱ��</th>
	  </tr>
	  <%int xuhao=1;
	  int pagenum = 10;
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
			int inum=(nowpage-1)*pagenum;
			int k=inum+1;
			while(inum>0){
			rs.next();
			inum--;}
	    
	  %>
	<%int j=0;
	//out.print(jieci);
	while(rs.next()&&j < pagenum){%>
	<tr onMouseOver="javascript:this.bgColor='#efefef'" onMouseOut="javascript:this.bgColor='#ffffff'">
	<td width="30" align="left"><%=k%></td>
	<td><div align="left"><a href='showNew.jsp?table=media_news&id=<%=rs.getString("ne_id")%>'><%=rs.getString("ne_topic")%>..</a></div></td>
	<td width="140"><%=rs.getString("ne_time")%></td>
	 </tr>
	 
	<%k++;
	j++;
	}%>
</table>
</span>
<span class="bg2">
<center>
      <table width="400" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td align="center">��<%=nowpage%>ҳ </td>
          <td align="center"><%if(nowpage>1){%>
            <a href="?page=<%=nowpage-1%>">��һҳ</a>
          <%}%></td>
          <td align="center"><%if(nowpage<allpage){%>
            <a href="?page=<%=nowpage+1%>">��һҳ</a>
          <%}%></td>
          <td align="center">��<%=allpage%>ҳ</td>
        </tr>
      </table>
</center>
</span>

</body>
</html>