<%@page contentType="text/html; charset=GB2312" language="java" import="java.sql.*"%>
<jsp:useBean id="conn" class="javabean.Conn" scope="session"></jsp:useBean>
<html>
<head>
<title>��ӹ���</title>
<link href="../css/main_style.css" rel="stylesheet" type="text/css">
</head>
<script type="text/javascript">
function check(mark){
    if(window.confirm(mark)){
         return true;
    }
    else return false;
}
</script>
<body>
<%
String area=null;
     area=request.getParameter("area");
	 if(area!=null){
	 area=new String(area.getBytes("ISO-8859-1"),"GB2312");}
	 else {area="����";}
	 
String floor1=null;
     floor1=request.getParameter("floor1");
	 if(floor1!=null){
	 floor1=new String(floor1.getBytes("ISO-8859-1"),"GB2312");}
	 else {floor1="10";}
%>
<span class="bg">
<form action="servlet.AddFault" method="post" name="fault">
    λ��:
<select name="area" id="areaselectID" onChange="changeweek(this.id)">
<option <%if(area.equals("����")){ out.print("selected");}%> value="����">����</option>
<option <%if(area.equals("����")){ out.print("selected");}%> value="����">����</option></select>
&nbsp;¥��<select name="floor1" id="floor1selectID" onChange="changeweek(this.id)">
<%String sql1="select * from media_site where sit_area='"+area+"'";
ResultSet rs1=conn.stmt.executeQuery(sql1);
while(rs1.next()){
%>
<option <%if(floor1.equals(rs1.getString(3))){ out.print("selected");}%> value=<%=rs1.getString(3)%>><%=rs1.getString(2)%></option>
<%}%>
</select>
<br>
����:
<input type="text" name="room" />(��ʽ101)
  <br />
����:
<input type="text" name="topic" />
<br />
����:
<textarea name="content" cols="90" rows="20"></textarea>
<br>
<center>
<input name="submit" type="submit" onClick="return check('ȷ���ύ')" value="ȷ��">
<a href="faulthuifu.jsp">����</a>
</center>
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
      window.location.href='addfault.jsp?area='+area+'&floor1='+floor1+'';
		
 }
 </script>
</span>
</body>
</html>
