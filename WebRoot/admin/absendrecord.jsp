<%@page contentType="text/html; charset=GB2312" language="java" import="java.sql.*"%>
<jsp:useBean id="conn" class="javabean.Conn" scope="session"></jsp:useBean>
<html>
<head>
<title>����Ա</title>
<link href="../css/main_style.css" rel="stylesheet" type="text/css">
</head>
<body>
<span class="current"><font color="#F00">��ǰλ��:</font>�����û�</span>
<p>
<%
Object num=session.getAttribute("num");
Object name=session.getAttribute("name");
Object depart=session.getAttribute("depart");
Object intweek=session.getAttribute("intweek");
Object intweekday=session.getAttribute("intweekday");
Object intmonth=session.getAttribute("intmonth");
Object intday=session.getAttribute("intday");
%>
<%
 String mark=null;
 //mark=new String(request.getParameter("mark").,"GB2312");
 mark=request.getParameter("mark");
 if(mark!=null){
 mark=new String(mark.getBytes("ISO-8859-1"));
 }
 else { mark="��ʦ";}
 
 String remind=null;
  remind=request.getParameter("remind");
 if(remind!=null){
 remind=new String(remind.getBytes("ISO-8859-1"));
 }
 else { remind="0";}
 
  String make=null;
  make=request.getParameter("make");
 if(make!=null){
 make=new String(make.getBytes("ISO-8859-1"));
 }
 else { make="-1";}
 
  String id=null;
  id=request.getParameter("id");
 if(id!=null){
 id=new String(id.getBytes("ISO-8859-1"));
 }
 else { id="0";}
 
  String password=null;
  password=request.getParameter("password");
 if(password!=null){
 password=new String(password.getBytes("ISO-8859-1"));
 }
 else { password="1";}
 
 String userdepart=null;
     userdepart=request.getParameter("userdepart");
	 if(userdepart!=null && userdepart.length()!=0){
	 userdepart=new String(userdepart.getBytes("ISO-8859-1"),"GB2312");
	 }
	 else {userdepart="0";}
	 if(userdepart.equals("����")){userdepart="0";}
 String username=null;
     username=request.getParameter("username");
	 if(username!=null && username.length()!=0){
	 username=new String(username.getBytes("ISO-8859-1"),"GB2312");
	 }
	 else {username="";}
	 
 String usernum=null;
     usernum=request.getParameter("usernum");
	 if(usernum!=null && usernum.length()!=0){
	 usernum=new String(usernum.getBytes("ISO-8859-1"),"GB2312");
	 }
	 else {usernum="";}
%>
<form method="post" action="?">
<span class="bg">
�����û�<br>
<select name="userdepart"> 
<option <%if(userdepart.equals("'��Ϣ����ѧԺ'")) out.print("selected");%> value="'��Ϣ����ѧԺ'">��Ϣ����ѧԺ</option>
<option <%if(userdepart.equals("'����ѧԺ'")) out.print("selected");%> value="'����ѧԺ'">����ѧԺ</option>
<option <%if(userdepart.equals("'��ѧԺ'")) out.print("selected");%> value="'��ѧԺ'">��ѧԺ</option>
<option <%if(userdepart.equals("'����Ժ'")) out.print("selected");%> value="'����Ժ'">����Ժ</option>
<option <%if(userdepart.equals("'��ѧϵ'")) out.print("selected");%> value="'��ѧϵ'">��ѧϵ</option>
<option <%if(userdepart.equals("'����ϵ'")) out.print("selected");%> value="'����ϵ'">����ϵ</option>
<option <%if(userdepart.equals("'����ѧԺ'")) out.print("selected");%> value="'����ѧԺ'">����ѧԺ</option>
<option <%if(userdepart.equals("'����ϵ'")) out.print("selected");%> value="'����ϵ'">����ϵ</option>
<option <%if(userdepart.equals("'���ϵ'")) out.print("selected");%> value="'���ϵ'">���ϵ</option>
<option <%if(userdepart.equals("'����ϵ'")) out.print("selected");%> value="'����ϵ'">����ϵ</option>
<option <%if(userdepart.equals("'��ѧϵ'")) out.print("selected");%> value="'��ѧϵ'">��ѧϵ</option>
<option <%if(userdepart.equals("'����ϵ'")) out.print("selected");%> value="'����ϵ'">����ϵ</option>
<option <%if(userdepart.equals("'����ѧԺ'")) out.print("selected");%> value="'����ѧԺ'">����ѧԺ</option>
<option <%if(userdepart.equals("'�ֽ�����'")) out.print("selected");%> value="'�ֽ�����'">�ֽ�����</option>
<option <%if(userdepart.equals("'�칫��'")) out.print("selected");%> value="'�칫��'">�칫��</option>
<option <%if(userdepart.equals("'������'")) out.print("selected");%> value="'������'">������</option>
<option <%if(userdepart.equals("'��ί������'")) out.print("selected");%> value="'��ί������'">��ί������</option>
<option <%if(userdepart.equals("'���ʴ�'")) out.print("selected");%> value="'���ʴ�'">���ʴ�</option>
<option <%if(userdepart.equals("'���ڷ�����'")) out.print("selected");%> value="'���ڷ�����'">���ڷ�����</option>
<option <%if(userdepart.equals("'��ѧ�о���'")) out.print("selected");%> value="'��ѧ�о���'">��ѧ�о���</option>
<option <%if(userdepart.equals("'��ί(�����)'")) out.print("selected");%> value="'��ί(�����)'">��ί(�����)</option>
<option <%if(userdepart.equals("'����'")) out.print("selected");%> value="'����'">����</option>
<option <%if(userdepart.equals("'���´�'")) out.print("selected");%> value="'���´�'">���´�</option>
<option <%if(userdepart.equals("'ͼ���'")) out.print("selected");%> value="'ͼ���'">ͼ���</option>
<option <%if(userdepart.equals("'У����'")) out.print("selected");%> value="'У����'">У����</option>
<option <%if(userdepart.equals("'У��ί'")) out.print("selected");%> value="'У��ί'">У��ί</option>
<option <%if(userdepart.equals("'УҽԺ'")) out.print("selected");%> value="'УҽԺ'">УҽԺ</option>
<option <%if(userdepart.equals("'ѧ����'")) out.print("selected");%> value="'ѧ����'">ѧ����</option>
<option <%if(userdepart.equals("'����'")) out.print("selected");%> value="'����'">����</option>
<option <%if(userdepart.equals("'У�쵼'")) out.print("selected");%> value="'У�쵼'">У�쵼</option>
<option <%if(userdepart.equals("'���д�'")) out.print("selected");%> value="'���д�'">���д�</option>
<option <%if(userdepart.equals("0")) out.print("selected");%> >����</option>
</select> &nbsp;&nbsp;
����<input type="text" name="username" value="<%=username%>">(��:��)&nbsp;&nbsp;����<input type="text" name="usernum" value="<%=usernum%>">&nbsp;&nbsp;<input type="submit" value="ȷ��">
</span>
</form>
<%ResultSet rs;
String sql;
if(make.equals("0")){
try{
sql="update media_users set user_state='����' where user_id='"+id+"'";
conn.stmt.executeUpdate(sql);
out.print("<script>alert('�ύ�ɹ�');</script>");
}
catch(SQLException ee){ out.print("sql�쳣");}
}
else if(make.equals("1")){
sql="delete from media_users where user_id='"+id+"'";
conn.stmt.executeUpdate(sql);
out.print("<script>alert('��ɾ��');</script>");
}
%>

<%
int nowpage=1;
String strusernum="";
String strusername="";
String struserdepart="";
if(!userdepart.equals("0"))
struserdepart="and  user_depart="+userdepart;
if(!username.equals("0")){
strusername="and user_name like '"+username+"%'";}
if(!usernum.equals("0")){
strusernum="and user_num like '"+usernum+"%'";}
 try{sql="select * from media_users where user_mark='"+mark+"' "+struserdepart+" "+strusernum+" "+strusername;
 //out.print(sql);
 rs=conn.stmt.executeQuery(sql);


            int pagenum = 9;
			
			String currentpagestr = null;
			int allpage=1;
			int all;
			
			//String kkk=request.getParameter("kkk");
					request.setCharacterEncoding("gbk");
			currentpagestr = request.getParameter("page");
			if (currentpagestr != null)
				//nowpage = Integer.valueOf(currentpagestr); 
				nowpage=Integer.parseInt(currentpagestr);
				//if(nowpage==0)
			//out.print("<script>alert('���¼');window.location.href='landing.jsp';</script>");
			rs.last();
			all= rs.getRow();
			allpage=(all-1)/pagenum +1;
			rs.beforeFirst();
			int i=(nowpage-1)*pagenum;
			int k=i+1;
			while(i>0){
			rs.next();
			i--;}
	    
%>


<table width="100%" border="1" bordercolor="#CCCCCC">

<tr>
<td valign="top">
<table width="100%" border="1" bordercolor="#CCCCCC">
<tr>
<th>�ʺ�</th>
<th>����</th>
<th>Ժϵ</th>
<th>�绰</th>
<th>����</th>
<th>״̬</th>
<th>�鿴����</th>
<th>��������</th>
<th></th>
<th></th>
</tr>
<%int j=0;
while(rs.next() &&j < pagenum){%><tr onMouseOver="javascript:this.bgColor='#efefef'" onMouseOut="javascript:this.bgColor='#ffffff'">
<td><%=rs.getString(2)%></td>
<td><%=rs.getString(4)%></td>
<td><%=rs.getString(5)%></td>
<td><%=rs.getString(7)%></td>
<td><%=rs.getString(8)%></td>
<td><%=rs.getString(9)%></td>
<td><a href="?mark=<%=mark%>&page=<%=nowpage%>&remind=<%=rs.getString(1)%>&password=0">�鿴����</a>
</td>
<td><a href="?mark=<%=mark%>&page=<%=nowpage%>&remind=<%=rs.getString(1)%>">�������ѻ�����</a></td>
<td><a href="sendmail.jsp?id=<%=rs.getString(1)%>&page=<%=nowpage%>">�ʼ�</a></td>
</tr><%j++;}%>
</table>

<center>
<table width="400" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="center">��<%=nowpage%>ҳ</td>
    <td align="center"><%if(nowpage>1){%>
      <a href="?page=<%=nowpage-1%>&userdepart=<%=userdepart%>&usernum=<%=usernum%>&username=<%=username%>">��һҳ</a>
      <%}%></td>
    <td align="center"><%if(nowpage<allpage){%>
      <a href="?page=<%=nowpage+1%>&userdepart=<%=userdepart%>&usernum=<%=usernum%>&username=<%=username%>">��һҳ</a>
      <%}%></td>
    <td align="center">��<%=allpage%>ҳ</td>
  </tr>
</table>
</center>
<% }
  catch(SQLException e1)
{
 out.print("SQL�쳣");
}%>
</td>
<td>
<%
if(!remind.equals("0") && !password.equals("0")){
sql ="select * from media_users where user_id='"+remind+"'";
 rs=conn.stmt.executeQuery(sql);
 rs.next();
out.print("�㽫��&nbsp;&nbsp;"+rs.getString(10)+""+rs.getString(4)+"("+rs.getString(2)+")&nbsp;&nbsp;��������<br>");
%>
<form method="post" action=".Remind?remind=<%=remind%>" name="guanli">
<textarea rows="18" cols="25" name="content"></textarea><br>
(����Ϊ��)
<input type="submit" value="ȷ��" onClick="return remind()"><a href="?mark=<%=mark%>&page=<%=nowpage%>&remind=0">����</a>
<%}
else if(password.equals("0")){
try{
sql ="select * from media_users where user_id='"+remind+"'";
 rs=conn.stmt.executeQuery(sql);
 rs.next();
%>
<script type="text/javascript">
var vname="<%=rs.getString(4)%>";
var vdepart="<%=rs.getString(5)%>";
var vnum="<%=rs.getString(2)%>";
var vtelephone="<%=rs.getString(7)%>";
var vmail="<%=rs.getString(8)%>";
var vpassword="<%=rs.getString(3)%>";
alert('����:'+vname+'\nԺϵ:'+vdepart+'\n����:'+vnum+'\n�绰:'+vtelephone+'\n����:'+vmail);

</script>
<% 
 }
  catch(SQLException e1)
{
 out.print("SQL�쳣");
}
}%>
</form>
</td></tr>
</table>
<div align="right"><a href="loginmail.jsp">��½����</a></div>
</body>
</html>
