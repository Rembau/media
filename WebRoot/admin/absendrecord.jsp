<%@page contentType="text/html; charset=GB2312" language="java" import="java.sql.*"%>
<jsp:useBean id="conn" class="javabean.Conn" scope="session"></jsp:useBean>
<html>
<head>
<title>管理员</title>
<link href="../css/main_style.css" rel="stylesheet" type="text/css">
</head>
<body>
<span class="current"><font color="#F00">当前位置:</font>管理用户</span>
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
 else { mark="教师";}
 
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
	 if(userdepart.equals("不限")){userdepart="0";}
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
查找用户<br>
<select name="userdepart"> 
<option <%if(userdepart.equals("'信息工程学院'")) out.print("selected");%> value="'信息工程学院'">信息工程学院</option>
<option <%if(userdepart.equals("'旅游学院'")) out.print("selected");%> value="'旅游学院'">旅游学院</option>
<option <%if(userdepart.equals("'文学院'")) out.print("selected");%> value="'文学院'">文学院</option>
<option <%if(userdepart.equals("'经管院'")) out.print("selected");%> value="'经管院'">经管院</option>
<option <%if(userdepart.equals("'数学系'")) out.print("selected");%> value="'数学系'">数学系</option>
<option <%if(userdepart.equals("'外语系'")) out.print("selected");%> value="'外语系'">外语系</option>
<option <%if(userdepart.equals("'艺术学院'")) out.print("selected");%> value="'艺术学院'">艺术学院</option>
<option <%if(userdepart.equals("'体育系'")) out.print("selected");%> value="'体育系'">体育系</option>
<option <%if(userdepart.equals("'社科系'")) out.print("selected");%> value="'社科系'">社科系</option>
<option <%if(userdepart.equals("'建筑系'")) out.print("selected");%> value="'建筑系'">建筑系</option>
<option <%if(userdepart.equals("'化学系'")) out.print("selected");%> value="'化学系'">化学系</option>
<option <%if(userdepart.equals("'教育系'")) out.print("selected");%> value="'教育系'">教育系</option>
<option <%if(userdepart.equals("'生环学院'")) out.print("selected");%> value="'生环学院'">生环学院</option>
<option <%if(userdepart.equals("'现教中心'")) out.print("selected");%> value="'现教中心'">现教中心</option>
<option <%if(userdepart.equals("'办公室'")) out.print("selected");%> value="'办公室'">办公室</option>
<option <%if(userdepart.equals("'保卫处'")) out.print("selected");%> value="'保卫处'">保卫处</option>
<option <%if(userdepart.equals("'党委宣传部'")) out.print("selected");%> value="'党委宣传部'">党委宣传部</option>
<option <%if(userdepart.equals("'国资处'")) out.print("selected");%> value="'国资处'">国资处</option>
<option <%if(userdepart.equals("'后勤服务集团'")) out.print("selected");%> value="'后勤服务集团'">后勤服务集团</option>
<option <%if(userdepart.equals("'徽学研究所'")) out.print("selected");%> value="'徽学研究所'">徽学研究所</option>
<option <%if(userdepart.equals("'纪委(监察室)'")) out.print("selected");%> value="'纪委(监察室)'">纪委(监察室)</option>
<option <%if(userdepart.equals("'教务处'")) out.print("selected");%> value="'教务处'">教务处</option>
<option <%if(userdepart.equals("'人事处'")) out.print("selected");%> value="'人事处'">人事处</option>
<option <%if(userdepart.equals("'图书馆'")) out.print("selected");%> value="'图书馆'">图书馆</option>
<option <%if(userdepart.equals("'校工会'")) out.print("selected");%> value="'校工会'">校工会</option>
<option <%if(userdepart.equals("'校团委'")) out.print("selected");%> value="'校团委'">校团委</option>
<option <%if(userdepart.equals("'校医院'")) out.print("selected");%> value="'校医院'">校医院</option>
<option <%if(userdepart.equals("'学生处'")) out.print("selected");%> value="'学生处'">学生处</option>
<option <%if(userdepart.equals("'总务处'")) out.print("selected");%> value="'总务处'">总务处</option>
<option <%if(userdepart.equals("'校领导'")) out.print("selected");%> value="'校领导'">校领导</option>
<option <%if(userdepart.equals("'科研处'")) out.print("selected");%> value="'科研处'">科研处</option>
<option <%if(userdepart.equals("0")) out.print("selected");%> >不限</option>
</select> &nbsp;&nbsp;
姓名<input type="text" name="username" value="<%=username%>">(如:张)&nbsp;&nbsp;工号<input type="text" name="usernum" value="<%=usernum%>">&nbsp;&nbsp;<input type="submit" value="确定">
</span>
</form>
<%ResultSet rs;
String sql;
if(make.equals("0")){
try{
sql="update media_users set user_state='正常' where user_id='"+id+"'";
conn.stmt.executeUpdate(sql);
out.print("<script>alert('提交成功');</script>");
}
catch(SQLException ee){ out.print("sql异常");}
}
else if(make.equals("1")){
sql="delete from media_users where user_id='"+id+"'";
conn.stmt.executeUpdate(sql);
out.print("<script>alert('已删除');</script>");
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
			//out.print("<script>alert('请登录');window.location.href='landing.jsp';</script>");
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
<th>帐号</th>
<th>姓名</th>
<th>院系</th>
<th>电话</th>
<th>邮箱</th>
<th>状态</th>
<th>查看密码</th>
<th>发布提醒</th>
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
<td><a href="?mark=<%=mark%>&page=<%=nowpage%>&remind=<%=rs.getString(1)%>&password=0">查看详情</a>
</td>
<td><a href="?mark=<%=mark%>&page=<%=nowpage%>&remind=<%=rs.getString(1)%>">发布提醒或任务</a></td>
<td><a href="sendmail.jsp?id=<%=rs.getString(1)%>&page=<%=nowpage%>">邮件</a></td>
</tr><%j++;}%>
</table>

<center>
<table width="400" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="center">第<%=nowpage%>页</td>
    <td align="center"><%if(nowpage>1){%>
      <a href="?page=<%=nowpage-1%>&userdepart=<%=userdepart%>&usernum=<%=usernum%>&username=<%=username%>">上一页</a>
      <%}%></td>
    <td align="center"><%if(nowpage<allpage){%>
      <a href="?page=<%=nowpage+1%>&userdepart=<%=userdepart%>&usernum=<%=usernum%>&username=<%=username%>">下一页</a>
      <%}%></td>
    <td align="center">共<%=allpage%>页</td>
  </tr>
</table>
</center>
<% }
  catch(SQLException e1)
{
 out.print("SQL异常");
}%>
</td>
<td>
<%
if(!remind.equals("0") && !password.equals("0")){
sql ="select * from media_users where user_id='"+remind+"'";
 rs=conn.stmt.executeQuery(sql);
 rs.next();
out.print("你将对&nbsp;&nbsp;"+rs.getString(10)+""+rs.getString(4)+"("+rs.getString(2)+")&nbsp;&nbsp;发布提醒<br>");
%>
<form method="post" action=".Remind?remind=<%=remind%>" name="guanli">
<textarea rows="18" cols="25" name="content"></textarea><br>
(不能为空)
<input type="submit" value="确定" onClick="return remind()"><a href="?mark=<%=mark%>&page=<%=nowpage%>&remind=0">返回</a>
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
alert('姓名:'+vname+'\n院系:'+vdepart+'\n工号:'+vnum+'\n电话:'+vtelephone+'\n邮箱:'+vmail);

</script>
<% 
 }
  catch(SQLException e1)
{
 out.print("SQL异常");
}
}%>
</form>
</td></tr>
</table>
<div align="right"><a href="loginmail.jsp">登陆邮箱</a></div>
</body>
</html>
