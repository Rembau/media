<%@ page contentType="text/html;charset=GB2312" language="java" import="java.sql.*"%>

<jsp:useBean id="conn" class="javabean.Conn" scope="session"></jsp:useBean>
<html>
<head>
<title>����</title>
<link href="../css/main_style.css" rel="stylesheet" type="text/css">
</head>
<body> 
<%
String id=null;
     id=request.getParameter("id");
	 if(id!=null){
	 id=new String(id.getBytes("ISO-8859-1"),"GB2312");}
	 else {id="0";}
String nowpage=null;
     nowpage=request.getParameter("page");
	 if(nowpage!=null){
	 nowpage=new String(nowpage.getBytes("ISO-8859-1"),"GB2312");}
	 else {nowpage="0";}

String accept=null;
	 
try{
String sql="select * from media_users where user_id='"+id+"'";
ResultSet rs=conn.stmt.executeQuery(sql);
rs.next();
accept=rs.getString(8);
}
 catch(SQLException e){
   out.print("sql�쳣");
   }
%>
<span class="bg">
<form action="*.Rukutest" method="post">
�� ��
  ��
  <input type="text" name="topic" value="����"><br>
  �ռ��ˣ�
  <input type="text" name="accept" value="<%=accept%>">
  <br>
  �� �ݣ�&nbsp;
  <textarea name="content" cols="90" rows="20">����</textarea><br>
  <center>
  <input type="submit" value="ȷ��" />
   <a href="absendrecord.jsp?page=<%=nowpage%>">����</a>
  </center>
</form>
 

</span>
</body>
</html>