<%@page contentType="text/html; charset=GB2312" language="java" import="java.sql.*"%>
<jsp:useBean id="conn" class="javabean.Conn" scope="session"></jsp:useBean>
<html>
<head>
<title>��¼�����ʼ�</title>
<link href="../css/main_style.css" rel="stylesheet" type="text/css">
</head>
<body>
<span class="current"><font color="#F00">��ǰλ��:</font>��¼����</span><br>
<span class="bg">

<% 
Object num=session.getAttribute("num");

String mailnum=null;
     mailnum=request.getParameter("mailnum");
	 if(mailnum!=null){
	 mailnum=new String(mailnum.getBytes("ISO-8859-1"),"GB2312");}
	 else {mailnum="0";}
	 
String password=null;
     password=request.getParameter("password");
	 if(password!=null){
	 password=new String(password.getBytes("ISO-8859-1"),"GB2312");}
	 else {password="0";}
	 
String service=null;
     service=request.getParameter("service");
	 if(service!=null){
	 service=new String(service.getBytes("ISO-8859-1"),"GB2312");}
	 else {service="0";}
	 
if(mailnum.length()!=0 && password.length()!=0 && !mailnum.equals("0") && !password.equals("0"))
{
try {
String sql="insert into media_mailnum(ma_user,ma_num,ma_password,ma_service) values('"+num.toString()+"','"+mailnum+"','"+password+"','"+service+"')";
conn.stmt.executeUpdate(sql);
}
catch(SQLException e){
   out.print("sql�쳣");
   }

}
ResultSet rs=conn.stmt.executeQuery("select * from media_mailnum where ma_user='"+num.toString()+"'");
if(rs.last()){
%>��ǰ�˺�:<%=rs.getString(1)%>
<%}%>
	 
<form action="?" method="post" name="loginmail">
��д�����ʺ�:
<input type="text" name="mailnum">(��504******@qq.com)<br>
��д����:
<input type="text" name="password"><br>
ѡ������:
<select name="service">
<option value="smtp.qq.com">qq����</option>
<option></option>
</select>
<input type="submit" value="ȷ��">
</form>
</span>
</body>
</html>