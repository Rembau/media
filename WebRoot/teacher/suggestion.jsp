<%@page contentType="text/html; charset=GB2312" language="java" import="java.sql.*,java.text.SimpleDateFormat,java.util.Date"%>

<jsp:useBean id="conn" class="javabean.Conn" scope="session"></jsp:useBean>
<html>
<head>
<title>建议或要求</title>
<link href="../css/main_style.css" rel="stylesheet" type="text/css">
</head>
<body>
<script type="text/javascript">
  function check(){
     if(window.confirm('确定删除?')){
        return true;
     }
     return false;
  }
  </script>
<script language="javascript">
function checksugg()
{
    var topic=document.suggestion.topic.value;
	var content=document.suggestion.content.value;
    
	if(document.suggestion.topic.value==''|| document.suggestion.content.value=='')
	{
		alert("标题或内容不能为空");
		window.location.reload();
		return false;
		}
	else if(topic.length>20){
		alert("标题不能超过20个字符!")
		return false;
		}
	else if(content.length>250){
		alert("内容不能超过250个字符!");
		return false;}
	return true;
	}
</script>
<%
Object num=session.getAttribute("num");
%>
<span class="current"><font color="#F00">当前位置:</font>提交建议</span>
<%
String id=null;
     id=request.getParameter("id");
	 if(id!=null){
	 id=new String(id.getBytes("ISO-8859-1"),"GB2312");}
	 else {id="0";}
if(!id.equals("0")){
conn.stmt.executeUpdate("delete from media_suggestion where su_id='"+id+"'");
}
%>
<br>
<span class="bg">  
<p>
<font color="#F00">注意:</font>每位用户对多媒体设备的使用建议和电脑软件的安装要求可以进行登记，并将由超级管理员提供回复。
</p>
<form method="post" action=".Suggestionruku" name="suggestion">
标题:
<input type="text" name="topic" size="30"><br>
内容:
<textarea name="content" rows="12" cols="90"></textarea>
<br>
<input type="submit" value="确定" onClick="return checksugg()"><input type="reset" value="重置">
</form>
</span>
<a href="allsuggestion.jsp">查看所有建议或要求</a>
<%
String sql="select * from media_suggestion where su_num='"+num.toString()+"'";
ResultSet rs=conn.stmt.executeQuery(sql);%><p>
<table width="100%" border="1" bordercolor="#CCCCCC">
<tr><th>主题</th><th>内容</th><th>状态</th><th>回复</th><th>操作</th></tr>
<%
while(rs.next())
{%>
<tr onMouseOver="javascript:this.bgColor='#efefef'" onMouseOut="javascript:this.bgColor='#ffffff'">
<td class="td_left"><%=rs.getString(3)%></td>
<td class="td_left"><%=rs.getString(4)%></td>
<td width="20"><%=rs.getString(10)%></td>
<td class="td_left"><%=rs.getString(9)%></td>
<td><a href="?id=<%=rs.getString(1)%>" onClick="return check()"><%if(rs.getString("su_num").equals(num.toString())){%>删除<%} %></a></td>
</tr>
<%
}
%></table>
</body>
</html>