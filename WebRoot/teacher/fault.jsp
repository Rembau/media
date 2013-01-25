<%@page contentType="text/html; charset=GB2312" language="java" import="java.sql.*,java.text.SimpleDateFormat,java.util.Date"%>

<jsp:useBean id="conn" class="javabean.Conn" scope="session"></jsp:useBean>

<html>
<head>
<title>故障申报</title>
<link href="../css/main_style.css" rel="stylesheet" type="text/css">
</head>
<body>
<%
String area=null;
     area=request.getParameter("area");
	 if(area!=null){
	 area=new String(area.getBytes("ISO-8859-1"),"GB2312");}
	 else {area="南区";}
	 
String floor1=null;
     floor1=request.getParameter("floor1");
	 if(floor1!=null){
	 floor1=new String(floor1.getBytes("ISO-8859-1"),"GB2312");}
	 else {floor1="10";}
%>
<span class="current"><font color="#F00">当前位置:</font>故障报告</span>
<br>
<span class="bg">
<form action="teacher.Faultruku" method="post" name="fault">
      位置:
<select name="area" id="areaselectID" onChange="changeweek(this.id)">
<option <%if(area.equals("南区")){ out.print("selected");}%> value="南区">南区</option>
<option <%if(area.equals("北区")){ out.print("selected");}%> value="北区">北区</option></select>
&nbsp;楼号<select name="floor1" id="floor1selectID" onChange="changeweek(this.id)">
<%String sql1="select * from media_site where sit_area='"+area+"'";
ResultSet rs1=conn.stmt.executeQuery(sql1);
while(rs1.next()){
%>
<option <%if(floor1.equals(rs1.getString(3))){ out.print("selected");}%> value=<%=rs1.getString(3)%>><%=rs1.getString(2)%></option>
<%}%>
</select>
<br>
教室:
  <input type="text" name="room" />(格式101)
  <br />
标题:
<input type="text" name="topic" />
<br />
内容:
<textarea name="content" cols="30" rows="20"></textarea>
<br>
<input name="submit" type="submit" onClick="return checkfault()" value="确定">
<input type="reset" value="重置">
</form>
<script type="text/javascript">
var floor1=document.fault.floor1.value;
var area=document.fault.area.value;
 function changeweek(x)
    {   
		var chose=document.getElementById(x).value;
		if(x=='areaselectID')
		area=chose;
		else floor1=chose;
      window.location.href='fault.jsp?area='+area+'&floor1='+floor1+'';
		
 }
 function checkfault()
{
	if(document.fault.room.value==''){
	alert("请输入教室");
	window.location.reload();
		return false;
	}
else if(document.fault.content.value==''){
	alert("请输入故障详细情况");
	window.location.reload();
		return false;
	}
	else if(document.fault.topic.value.length>15){
	   alert("标题不能超过15个字符!");
	   return false;
	}
}	
 </script>
<a href="lookfault.jsp">查看已报告故障</a>
</span>

</body>
</html>