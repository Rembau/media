<%@page contentType="text/html; charset=GB2312" language="java" import="java.sql.*"%>
<jsp:useBean id="conn" class="javabean.Conn" scope="session"></jsp:useBean>
<html>
<head>
<link rel="Shortcut Icon" href="../ico/1.ico">
<title>建议要求回复</title>
<link href="../css/main_style.css" rel="stylesheet" type="text/css">
</head>
<body><%
String id=null;
     id=request.getParameter("id");
	 if(id!=null){
	 id=new String(id.getBytes("ISO-8859-1"),"GB2312");}
%>

<%String sql;
 ResultSet rs;
sql="select * from media_suggestion where su_id='"+id+"'";
rs=conn.stmt.executeQuery(sql);
rs.next();
%>

<span class="bg">
<p><strong>收到的建议或要求:</strong><%=rs.getString(4)%></p>
<br>
<form method="post" action=".SuggReply?id=<%=id%>" name="suggestionhuifu">
回复内容:
<textarea name="reply" rows="10" cols="90"><%if(rs.getString(10).equals("已经回复")){%><%=rs.getString(9)%><%}%></textarea><br>
<center>
<input type="submit" value="回复">
</center>
</form>
<a href="suggestionhuifu.jsp">返回</a>

</span>
</body>
</html>