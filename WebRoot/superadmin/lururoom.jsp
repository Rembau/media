<%@page contentType="text/html; charset=GB2312" language="java" import="java.sql.*"%>
<jsp:useBean id="conn" class="javabean.Conn" scope="session"></jsp:useBean>
<html>
<head>
<title>¼�����</title>
<link href="../css/main_style.css" rel="stylesheet" type="text/css">
</head>
<script type="text/javascript">
function check1(mark){
    if(window.confirm(mark)){
         if(document.form.allroom.value==''){
            alert('��Ҫ�ύ������');
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
		alert('¥������Ϊ��');
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
<span class="current"><font color="#F00">��ǰλ��:</font>¼�����</span>
<br>
<span class="bg">
<%
Statement stmt=conn.getStmt();
Statement stmt1=conn.getStmt();

String area=null;
     area=request.getParameter("area");
	 if(area!=null){
	 area=new String(area.getBytes("ISO-8859-1"),"GB2312");}
	 else {area="����";}
%>
���н���<br>
<%
 String sql;
 ResultSet rs,rs1;
 try{ 
 sql="select * from media_site";
 rs1=stmt1.executeQuery(sql);
 while(rs1.next()){
 %>
 <%=rs1.getString(1)%><%=rs1.getString(2)%>: 
 <a href=".DeleteSite?area=<%=rs1.getString(1)%>&site=<%=rs1.getString(3)%>" onClick="return check('ȷ���ύ')"> ɾ����¥</a><br>
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
<a href=".DeletRoom?room=<%=rs.getString(2)%>&area=<%=rs.getString(3)%>" onClick="return check('ȷ���ύ')">
<%int introom=Integer.parseInt(rs.getString(2));
out.print(introom%1000);
%>&nbsp;ɾ</a>
</td><%}%><%cols--;}%>
</tr><%rows--;}}%>
</table>
<%
}
}   catch(SQLException e1)
{
 out.print("SQL�쳣");
}
%>
</span>

<span class="bg">
<h3>¥��(��¥��)¼��:</h3>
<form method="post" action="servlet.LayerRuku" name="form1">
<select name="area">
<option>����</option>
<option>����</option>
</select>
¥��(��¥��)
<input type="text" name="layer">
<input type="submit" value="ȷ��" onClick="return layer1('ȷ��')">
</form>
<h3>����¼��:</h3>
<form method="post" action=".LuruRoom" name="form">
ѡ��У��:
<select name="area" id="areaselectID" onChange="changeweek(this.id)">
<option <%if(area.equals("����")){ out.print("selected");}%> value="����">����</option>
<option <%if(area.equals("����")){ out.print("selected");}%> value="����">����</option></select>
&nbsp;¥��<select name="layer">
<%sql="select * from media_site where sit_area='"+area+"'";
rs=stmt.executeQuery(sql);
while(rs.next()){
%>
<option><%=rs.getString(2)%></option><%}%>
</select>
<br>
��д����:(���Ҹ�ʽΪ101,001,��,�������ö��Ż�ո����)
ע��:¼����̽���,�����ĵȴ�<br>
<textarea name="allroom" cols="90" rows="10"></textarea><br>
<input type="submit" value="ȷ��" onclick="return check1('ȷ���ύ')">
</form>
</span>
</body>
</html>
