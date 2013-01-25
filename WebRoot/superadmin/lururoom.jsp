<%@page contentType="text/html; charset=GB2312" language="java" import="java.sql.*"%>
<jsp:useBean id="conn" class="javabean.Conn" scope="session"></jsp:useBean>
<html>
<head>
<title>录入教室</title>
<link href="../css/main_style.css" rel="stylesheet" type="text/css">
</head>
<script type="text/javascript">
function check1(mark){
    if(window.confirm(mark)){
         if(document.form.allroom.value==''){
            alert('不要提交空内容');
            return false;
         }
         return true;
    }
    else return false;
}
function check(mark){
    if(window.confirm(mark)){
         return true;
    }
    else return false;
}
function layer1(mark)
{
	if(document.form1.layer.value=='')
	{
		alert('楼名不能为空');
		window.location.reload();
		return false;
	}
	if(window.confirm(mark)){
         return true;
    }
    else return false;
}
function changeweek(x)
    {   
		var chose=document.getElementById(x).value;
		area=chose;
	    window.location.href='lururoom.jsp?area='+area+'';
	 }
 </script>
<body>
<span class="current"><font color="#F00">当前位置:</font>录入教室</span>
<br>
<span class="bg">
<%
Statement stmt=conn.getStmt();
Statement stmt1=conn.getStmt();

String area=null;
     area=request.getParameter("area");
	 if(area!=null){
	 area=new String(area.getBytes("ISO-8859-1"),"GB2312");}
	 else {area="南区";}
%>
已有教室<br>
<%
 String sql;
 ResultSet rs,rs1;
 try{ 
 sql="select * from media_site";
 rs1=stmt1.executeQuery(sql);
 while(rs1.next()){
 %>
 <%=rs1.getString(1)%><%=rs1.getString(2)%>: 
 <a href=".DeleteSite?area=<%=rs1.getString(1)%>&site=<%=rs1.getString(3)%>" onClick="return check('确定提交')"> 删除此楼</a><br>
 <%
sql="select * from media_rooms where ro_area='"+rs1.getString(1)+"' and ro_room like '"+rs1.getString(3)+"%' order by ro_room";
//out.print(sql);
 rs=stmt.executeQuery(sql);
int intallroom=0;
int cols;
int rows;
if(rs.last())
{
 intallroom=rs.getRow();
 rs.beforeFirst();

 cols=10;
 rows=intallroom/cols+1;
%>
<table border="1" style="empty-cells:show; border-collapse:collapse;">
<%while(rows>0){
cols=10;
%>
<tr>
<%while(cols>0){%>
<%if(rs.next()){%><td width="60">
<a href=".DeletRoom?room=<%=rs.getString(2)%>&area=<%=rs.getString(3)%>" onClick="return check('确定提交')">
<%int introom=Integer.parseInt(rs.getString(2));
out.print(introom%1000);
%>&nbsp;删</a>
</td><%}%><%cols--;}%>
</tr><%rows--;}}%>
</table>
<%
}
}   catch(SQLException e1)
{
 out.print("SQL异常");
}
%>
</span>

<span class="bg">
<h3>楼号(或楼名)录入:</h3>
<form method="post" action="servlet.LayerRuku" name="form1">
<select name="area">
<option>南区</option>
<option>北区</option>
</select>
楼号(或楼名)
<input type="text" name="layer">
<input type="submit" value="确定" onClick="return layer1('确认')">
</form>
<h3>教室录入:</h3>
<form method="post" action=".LuruRoom" name="form">
选择校区:
<select name="area" id="areaselectID" onChange="changeweek(this.id)">
<option <%if(area.equals("南区")){ out.print("selected");}%> value="南区">南区</option>
<option <%if(area.equals("北区")){ out.print("selected");}%> value="北区">北区</option></select>
&nbsp;楼名<select name="layer">
<%sql="select * from media_site where sit_area='"+area+"'";
rs=stmt.executeQuery(sql);
while(rs.next()){
%>
<option><%=rs.getString(2)%></option><%}%>
</select>
<br>
填写教室:(教室格式为101,001,等,各教室用逗号或空格隔开)
注意:录入过程较慢,请耐心等待<br>
<textarea name="allroom" cols="90" rows="10"></textarea><br>
<input type="submit" value="确认" onclick="return check1('确认提交')">
</form>
</span>
</body>
</html>
