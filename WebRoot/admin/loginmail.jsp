<%@page contentType="text/html; charset=GB2312" language="java" import="java.sql.*"%>
<jsp:useBean id="conn" class="javabean.Conn" scope="session"></jsp:useBean>
<html>
<head>
<title>登录邮箱邮件</title>
<link href="../css/main_style.css" rel="stylesheet" type="text/css">
</head>
<body>
<span class="current"><font color="#F00">当前位置:</font>登录邮箱</span><br>
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
   out.print("sql异常");
   }

}
ResultSet rs=conn.stmt.executeQuery("select * from media_mailnum where ma_user='"+num.toString()+"'");
if(rs.last()){
%>当前账号:<%=rs.getString(1)%>
<%}%>
	 
<form action="?" method="post" name="loginmail">
填写邮箱帐号:
<input type="text" name="mailnum">(如504******@qq.com)<br>
填写密码:
<input type="text" name="password"><br>
选择邮箱:
<select name="service">
<option value="smtp.qq.com">qq邮箱</option>
<option></option>
</select>
<input type="submit" value="确定">
</form>
</span>
</body>
</html>