<%@ page contentType="text/html;charset=GB2312" import="java.sql.*"%>
<html>
<HEAD>
<TITLE>�޸���Ϣ</TITLE>
<link href="../css/main_style.css" rel="stylesheet" type="text/css">
<jsp:useBean id="conn" class="javabean.Conn" scope="session"></jsp:useBean>
</HEAD>
<body>
<span class="current"><font color="#F00">��ǰλ��:</font>������Ϣ</span>
<br>
<script Language="Javascript" src="form.js"></Script>
<%
  String id=null;
  id=request.getParameter("id");
 if(id!=null){
 id=new String(id.getBytes("ISO-8859-1"));
 }
 else { id="0";}
 
 String sql="select * from media_users where user_id='"+id+"'";
 ResultSet rs=conn.stmt.executeQuery(sql);
 rs.next();
%>
<span class="bg">
�����û��ʺ�:<%=rs.getString(2)%>
<form name="change" action="changeanyruku.jsp?id=<%=id%>" method="post">
�����û�����:
<input type="text" name="username" style="width:150px" maxlength="20" value="<%=rs.getString(4)%>"><br>
���ĵ绰����:
<input type="text" name="telephone" style="width:150px" maxlength="20" value="<%=rs.getString(7)%>"><br>
���������ַ:
<input type="text" name="mail" style="width:150px" maxlength="20" value="<%=rs.getString(8)%>"><br>
�����ʺ�����:
<select name="type">
<option value="��ʦ">��ʦ</option>
<option value="����Ա">����Ա</option>
<option value="�ǽ�ѧ�����û�">�ǽ�ѧ�����û�</option>
</select><br>
��������Ժϵ:
<select name="depart"> 
<%
String userdepart=rs.getString(5);
sql = "select * from media_department"; 
rs = conn.stmt.executeQuery(sql);
while(rs.next())
{
%> 
<option <%if(userdepart.equals(rs.getString("de_name"))) 
out.print("selected");%> value="'<%=rs.getString("de_name") %>'"><%=rs.getString("de_name") %></option>
<%
}
%>
</select> (�������������ѡ����)<br>

<input type="submit" value="ȷ��">
</form> 
</span>
</body>
</html>
