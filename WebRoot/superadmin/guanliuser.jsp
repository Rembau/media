<%@page contentType="text/html; charset=GBK" language="java" import="java.sql.*"%>
<jsp:useBean id="conn" class="javabean.Conn" scope="session"></jsp:useBean>
<html>
<head>
<title>��������Ա</title>
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
<a href="?mark=��ʦ">��ʦ���Ź���</a>&nbsp;
<a href="?mark=����Ա">����Ա�ʺŹ���</a> &nbsp;&nbsp;
<a href="?mark=�ǽ�ѧ�����û�">�ǽ�ѧ�����û�����</a> &nbsp;&nbsp;
<a href="daoruteacher.jsp">�����ʦ��</a>&nbsp;&nbsp;
<a href="guanlicourse.jsp">�����ʱ��</a>&nbsp;&nbsp;
<a href="../admin/loginmail.jsp">��¼����</a>&nbsp;&nbsp;
<a href="adduser.jsp">����û�</a>

<form method="post" action="?mark=<%=mark%>">
<span class="bg">
�����û�<br>
<select name="userdepart">
<%
ResultSet rs;
String sql = "select * from media_department"; 
rs = conn.stmt.executeQuery(sql);
while(rs.next())
{
%> 
<option <%if(userdepart.equals("'"+rs.getString("de_name")+"'")) 
out.print("selected");%> value="'<%=rs.getString("de_name") %>'"><%=rs.getString("de_name") %></option>
<%
}
%>
<option <%if(userdepart.equals("0")) out.print("selected");%> >����</option>
</select> &nbsp;&nbsp;
����<input type="text" name="username" value="<%=username%>">(��:��)&nbsp;&nbsp;����<input type="text" name="usernum" value="<%=usernum%>">&nbsp;&nbsp;<input type="submit" value="ȷ��">
</span>
</form>
<%
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


            int pagenum = 30;
			
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
<td><a href="?mark=<%=mark%>&page=<%=nowpage%>&remind=<%=rs.getString(1)%>">�������ѻ�����</a></td><td><%if(rs.getString(9).equals("�����")){%>
<a href="?mark=<%=mark%>&page=<%=nowpage%>&id=<%=rs.getString(1)%>&make=0">ͨ��</a>
<%}%>
<a href="?mark=<%=mark%>&page=<%=nowpage%>&id=<%=rs.getString(1)%>&make=1" onClick="return check('ȷ��')">ɾ��</a>
</td>
<td><a href="sendmail.jsp?id=<%=rs.getString(1)%>&page=<%=nowpage%>">�ʼ�</a></td>
<td><a href="changeany.jsp?id=<%=rs.getString(1)%>">������Ϣ</a></td>
</tr><%j++;}%>
</table>

<center>
<table width="400" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="center">��<%=nowpage%>ҳ</td>
    <td align="center"><%if(nowpage>1){%>
      <a href="?page=<%=nowpage-1%>&userdepart=<%=userdepart%>&usernum=<%=usernum%>&username=<%=username%>&mark=<%=mark%>">��һҳ</a>
      <%}%></td>
    <td align="center"><%if(nowpage<allpage){%>
      <a href="?page=<%=nowpage+1%>&userdepart=<%=userdepart%>&usernum=<%=usernum%>&username=<%=username%>&mark=<%=mark%>">��һҳ</a>
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
alert('����:'+vname+'\nԺϵ:'+vdepart+'\n����:'+vnum+'\n�绰:'+vtelephone+'\n����:'+vmail+'\n��¼����:'+vpassword);

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

</body>
</html>