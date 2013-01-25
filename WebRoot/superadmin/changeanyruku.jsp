<%@ page contentType="text/html;charset=GB2312" language="java" import="java.sql.*" %>
<HTML xmlns="http://www.w3.org/1999/xhtml">
<jsp:useBean id="conn" class="javabean.Conn" scope="session"></jsp:useBean>
<HEAD>
<TITLE>修改密码</TITLE>
</HEAD>
<body>
<%
  String id=null;
  id=request.getParameter("id");
 if(id!=null){
 id=new String(id.getBytes("ISO-8859-1"));
 }
 else { id="0";}

String telephone=null;
     telephone=request.getParameter("telephone");
	 if(telephone!=null && telephone.length()!=0){
	 telephone=new String(telephone.getBytes("ISO-8859-1"),"GB2312");
	 telephone="'"+telephone+"'";
	 }
	 else {telephone="0";}
	 
String mail=null;
     mail=request.getParameter("mail");
	 if(mail!=null && mail.length()!=0){
	 mail=new String(mail.getBytes("ISO-8859-1"),"GB2312");
	 mail="'"+mail+"'";}
	 else {mail="0";}

String depart=null;
     depart=request.getParameter("depart");
	 if(depart!=null && depart.length()!=0){
	 depart=new String(depart.getBytes("ISO-8859-1"),"GB2312");
	 depart="'"+depart+"'";}
	 else {depart="0";}

String username=null;
     username=request.getParameter("username");
	 if(username!=null && username.length()!=0){
	 username=new String(username.getBytes("ISO-8859-1"),"GB2312");
	 username="'"+username+"'";
	 }
	 else {username="0";}
	 
String type=null;
     type=request.getParameter("type");
	 if(type!=null){
	 type=new String(type.getBytes("ISO-8859-1"),"GB2312");}
	 else {type="0";}
	 	 
String strtelephone=null,strmail=null,strdepart=null,strusername=null;
	 if(!telephone.equals("0")){ strtelephone=",user_telephone="+telephone;}
	 else strtelephone=" ";
	 if(!mail.equals("0")){ strmail=",user_mail="+mail;}
	 else strmail=" ";
	 if(!depart.equals("0")){ strdepart=",user_depart="+depart;}
	 else strdepart=" ";
	 if(!username.equals("0")){ strusername=",user_name="+username;}
	 else strusername=" ";
	 try{
	      String sql="update media_users set user_id='"+id+"'"+strtelephone+" "+strmail+" "+strdepart+" "+strusername+",user_mark='"+type+"' where user_id='"+id+"'";
		  //out.print(sql);
		  conn.stmt.executeUpdate(sql);
		  out.print("<script>alert('修改成功'); window.location.href='guanliuser.jsp';</script>");
	 }
	 
catch(SQLException e1)
{
 out.print("SQL异常");
}
%>
</body>
</HTML>