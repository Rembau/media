<%@page contentType="text/html; charset=GB2312" language="java" import="java.sql.*,java.text.SimpleDateFormat,java.util.Date"%>
<jsp:useBean id="conn" class="javabean.Conn" scope="session"></jsp:useBean>
<html>
<head>
<title>�����Ҫ��</title>
<link href="../css/main_style.css" rel="stylesheet" type="text/css">
</head>
<body>
<%
String sql="select * from media_suggestion";// where su_num='"+num.toString()+"'";
ResultSet rs=conn.stmt.executeQuery(sql);%><p>

<%int xuhao=1;
	  int pagenum = 5;
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
<table width="100%" border="1" bordercolor="#CCCCCC">
<%
while(rs.next())
{%>
<tr onMouseOver="javascript:this.bgColor='#efefef'" onMouseOut="javascript:this.bgColor='#ffffff'">
<td style="text-align:left">
<font color="#000000">����:</font><%=rs.getString(3)%><br>
<font color="#000000">����:</font><%=rs.getString(4)%><br>
<font color="#000000">״̬:</font><%=rs.getString(10)%><br>
<font color="#000000">����Ա�ظ�:</font><%=rs.getString(9)%>
</td>
</tr>
<%
}
%></table>
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