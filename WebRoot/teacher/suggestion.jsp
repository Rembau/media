<%@page contentType="text/html; charset=GB2312" language="java" import="java.sql.*,java.text.SimpleDateFormat,java.util.Date"%>

<jsp:useBean id="conn" class="javabean.Conn" scope="session"></jsp:useBean>
<html>
<head>
<title>�����Ҫ��</title>
<link href="../css/main_style.css" rel="stylesheet" type="text/css">
</head>
<body>
<script type="text/javascript">
  function check(){
     if(window.confirm('ȷ��ɾ��?')){
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
		alert("��������ݲ���Ϊ��");
		window.location.reload();
		return false;
		}
	else if(topic.length>20){
		alert("���ⲻ�ܳ���20���ַ�!")
		return false;
		}
	else if(content.length>250){
		alert("���ݲ��ܳ���250���ַ�!");
		return false;}
	return true;
	}
</script>
<%
Object num=session.getAttribute("num");
%>
<span class="current"><font color="#F00">��ǰλ��:</font>�ύ����</span>
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
<font color="#F00">ע��:</font>ÿλ�û��Զ�ý���豸��ʹ�ý���͵�������İ�װҪ����Խ��еǼǣ������ɳ�������Ա�ṩ�ظ���
</p>
<form method="post" action=".Suggestionruku" name="suggestion">
����:
<input type="text" name="topic" size="30"><br>
����:
<textarea name="content" rows="12" cols="90"></textarea>
<br>
<input type="submit" value="ȷ��" onClick="return checksugg()"><input type="reset" value="����">
</form>
</span>
<a href="allsuggestion.jsp">�鿴���н����Ҫ��</a>
<%
String sql="select * from media_suggestion where su_num='"+num.toString()+"'";
ResultSet rs=conn.stmt.executeQuery(sql);%><p>
<table width="100%" border="1" bordercolor="#CCCCCC">
<tr><th>����</th><th>����</th><th>״̬</th><th>�ظ�</th><th>����</th></tr>
<%
while(rs.next())
{%>
<tr onMouseOver="javascript:this.bgColor='#efefef'" onMouseOut="javascript:this.bgColor='#ffffff'">
<td class="td_left"><%=rs.getString(3)%></td>
<td class="td_left"><%=rs.getString(4)%></td>
<td width="20"><%=rs.getString(10)%></td>
<td class="td_left"><%=rs.getString(9)%></td>
<td><a href="?id=<%=rs.getString(1)%>" onClick="return check()"><%if(rs.getString("su_num").equals(num.toString())){%>ɾ��<%} %></a></td>
</tr>
<%
}
%></table>
</body>
</html>