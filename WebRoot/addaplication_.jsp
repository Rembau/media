<%@ page language="java" import="java.sql.*,java.util.*" pageEncoding="GBK"%>
<jsp:useBean id="conn" class="javabean.Conn" scope="session"></jsp:useBean>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title></title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/main_style.css">

  </head>
  
  <body>
    <%
    Statement stmt=conn.getStmt();
    Object intweek=session.getAttribute("intweek");
	Object intweekday=session.getAttribute("intweekday");

    String alljie=null;
     alljie=request.getParameter("alljie");
	 if(alljie!=null){
	 alljie=new String(alljie.getBytes("ISO-8859-1"),"GB2312");}
	 else {alljie="2";}
	 
String week=null;
     week=request.getParameter("week");
	 if(week!=null){
	 week=new String(week.getBytes("ISO-8859-1"),"GB2312");}
	 else {week=String.valueOf(intweek.toString());}
	 
String weekday=null;
     weekday=request.getParameter("weekday");
	 if(weekday!=null && !weekday.equals("0")){
	 weekday=new String(weekday.getBytes("ISO-8859-1"),"GB2312");}
	 else {weekday=String.valueOf(intweekday.toString());}
	 
String jieci=null;
     jieci=request.getParameter("jieci");
	 if(jieci!=null){
	 jieci=new String(jieci.getBytes("ISO-8859-1"),"GB2312");}
	 else {jieci="第一节";}
	 
String area=null;
     area=request.getParameter("area");
	 if(area!=null){
	 area=new String(area.getBytes("ISO-8859-1"),"GB2312");}
	 else {area="南区";}
	 
	String usernum=null;
     usernum=request.getParameter("usernum");
	 if(usernum!=null){
	 	usernum=new String(usernum.getBytes("ISO-8859-1"),"GB2312");
	 }
	 else {usernum="0";}
	 
   String ok=null;
     ok=request.getParameter("ok");
	 if(ok!=null){
	 ok=new String(ok.getBytes("ISO-8859-1"),"GB2312");}
	 else {ok="0";}
	 
int introom=Integer.parseInt(ok);
String sql="select * from media_site where sit_nummark='"+introom/1000+"'";
System.out.print(sql);
ResultSet rs=stmt.executeQuery(sql);
rs.next();
String floor2=rs.getString(2);
%>
<span class="bg">
<p>您选择了:<%=area%>&nbsp;&nbsp;<%=floor2%>
<%=introom%1000%>
第<%=week%>周&nbsp;&nbsp;<%=weekday%>&nbsp;&nbsp;&nbsp;<%=jieci%>等,时间段&nbsp;&nbsp;
<form action='.Addapplication?week=<%=week%>&area=<%=area%>&weekday=<%=weekday%>&jieci=<%=jieci%>&room=<%=ok%>&alljie=<%=alljie%>' method="post" name="form2">
输入申请人工号<input type="text"  onchange="getName(this.value)" onkeydown="return KeyDown()"/><br>
<input type="hidden" name="note" value="无">
<input type="hidden" name="usernum" value="<%=usernum%>">
<%
if(!usernum.equals("0"))
{
	sql="select * from media_users where user_num='"+usernum+"'";
	rs=stmt.executeQuery(sql);
	if(rs.next())
	{
		out.println("工号："+usernum);
		out.println("<br>姓名："+rs.getString("user_name"));
		out.println("<br>部门："+rs.getString("user_depart"));
		out.println("<input type=\"hidden\" value="+rs.getString("user_name")+" name=\"username\">");
		out.println("<input type=\"hidden\" value="+rs.getString("user_depart")+" name=\"userdepart\">");
		%>
		<br>
课程：<select name="courseName" id="courseName">
<%sql="select * from media_course where co_num='"+usernum+"'"; 
rs=stmt.executeQuery(sql);
while(rs.next()){
 sql="select * from sqcount where ap_num='"+usernum+"' and ap_courseName='"+rs.getString("co_courseName")+"'";
 ResultSet rs1 = conn.getStmt().executeQuery(sql);
 int count=0;
 if(rs1.next())
 {
 	count=rs1.getInt("courseNum");
 }
out.println("<option value="+rs.getString("co_courseName")+">"+rs.getString("co_courseName")+" "+count+"/"+rs.getString("co_courseNum")+"</option>");
}
%>
</select>
	 	<%
		out.println("<br>确定申请?<input type=\"submit\" value=\"确定\" onClick=\"return check()\">");
	} else
	{
		out.println("请输入正确的工号！");
	}
}
%>

</form>
</span>
<script type="text/javascript">
function check()
{
	if(document.form2.courseName.value=='')
	{
		alert('没有课程可选！');
		return false;
	}
	if(!window.confirm('确定提交？'))
	{
		return false;
	}
}
function getName(num)
{
	window.location.href='addaplication_.jsp?area=<%=area%>&jieci=<%=jieci%>&week=<%=week%>&weekday=<%=weekday%>&alljie=<%=alljie%>&usernum='+num+'&ok=<%=introom%>';
}
function KeyDown(){ 
	if (event.keyCode==13)
		event.returnValue=false;
}
</script>
  </body>
</html>
