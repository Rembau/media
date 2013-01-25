<%@page contentType="text/html; charset=GB2312" language="java" import="java.sql.*"%>
<jsp:useBean id="conn" class="javabean.Conn" scope="session"></jsp:useBean>
<html>
<head>
<title></title>
<link href="../css/main_style.css" rel="stylesheet" type="text/css">
</head>
<script type="text/javascript">
function check(mark){
    if(window.confirm(mark)){
         return true;
    }
    else return false;
}
function checkPart(){
if(document.getElementById('part').value==""){
        alert("你不能提交空值");
        return false;
    }
    return true;
}
</script>
<body>
<span class="current"><font color="#F00">当前位置:</font>教室故障操作</span>
<br>
<%
String mediadepart=null;
     mediadepart=request.getParameter("mediadepart");
	 if(mediadepart!=null){
	 mediadepart=new String(mediadepart.getBytes("ISO-8859-1"),"GB2312");}
	 else {mediadepart="0";}
	 
String id=null;
     id=request.getParameter("id");
	 if(id!=null){
	 id=new String(id.getBytes("ISO-8859-1"),"GB2312");}
	 else {id="0";}
	 
	 String sql;
	 if(!id.equals("0")){
	 sql="delete from media_mediadepart where med_id='"+id+"'";
	 conn.stmt.executeUpdate(sql);
	 }
	 if(!mediadepart.equals("0") && mediadepart.length()!=0){
	 sql="insert into media_mediadepart(med_depart) value('"+mediadepart+"')";
	 conn.stmt.executeUpdate(sql);
	 }
%>
<span class="bg">已设置关键字:
<%
sql="select * from media_mediadepart";
ResultSet rs=conn.stmt.executeQuery(sql);
%>
<table border="1" style="empty-cells:show; border-collapse:collapse;">
<tr><%while(rs.next()){%><td><a href="?id=<%=rs.getString(1)%>" onClick="return check('确定提交')"><%=rs.getString(2)%>&nbsp;删除</a>&nbsp;</td><%}%>
</tr></table>

</span>
<form method="post" action="?">
添加
<span class="bg">
<input id="part" type="text" name="mediadepart" />
<input type="submit" value="确定" onclick="return checkPart()"></span>
</form>