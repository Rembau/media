<%@page contentType="text/html; charset=GBK" language="java" import="java.sql.*"%>
<jsp:useBean id="conn" class="javabean.Conn" scope="session"></jsp:useBean>
<html>
<head>
<title>查看教师申请</title>
<link href="../css/main_style.css" rel="stylesheet" type="text/css">
</head>
<script type="text/javascript">
function check(mark){
    if(window.confirm(mark)){
         return true;
    }
    else return false;
}
function change(id){
    var userdepart=document.form1.userdepart.value;
    var usernum=document.form1.usernum.value;
    var username=document.form1.username.value;
    var chose=document.getElementById(id).value;
    window.location.href='?userdepart='+userdepart+'&usernum='+usernum+'&username='+username+'&week='+chose+'';
}
</script>
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
 String week=null;
  week=request.getParameter("week");
 if(week!=null){
 week=new String(week.getBytes("ISO-8859-1"));
 }
 else { week=intweek.toString();}
 
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
<form method="post" action="?" name="form1">
<span class="bg">
查找用户<br>
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
<option <%if(userdepart.equals("0")) out.print("selected");%> >不限</option>
</select> &nbsp;&nbsp;
姓名<input type="text" name="username" value="<%=username%>">(如:张)&nbsp;&nbsp;工号<input type="text" name="usernum" value="<%=usernum%>">&nbsp;&nbsp;<input type="submit" value="确定">
</span>
</form>
<form action="?" type=post name="form2">
请选择周次:
<select id="weekId" onChange="change(this.id)" name ="week">
<%
sql = "select * from media_week"; 
rs = conn.stmt.executeQuery(sql);
int weekNum=25;
if(rs.next())
{
	weekNum=rs.getInt("we_num");
}
for(int i=1;i<=weekNum;i++) {%>
<option <%if(week.equals(String.valueOf(i))) out.print("selected"); %> value=<%=i %>>第<%=i %>周</option>
<%} %>
<option <%if(week.equals(String.valueOf(0))) out.print("selected"); %> value=0>不限</option>
</select>
</form>
<%
int nowpage=1;
String strusernum="";
String strusername="";
String struserdepart="";
String strweek="";
if(!userdepart.equals("0"))
struserdepart="and  ap_depart="+userdepart;
if(!username.equals("")){
strusername="and ap_name like '"+username+"%'";}
if(!usernum.equals("")){
strusernum="and ap_num like '"+usernum+"%'";}
if(!week.equals("0")){
strweek="and ap_week ='"+week+"'";
}
 try{
    sql="select *,count(*) as c from media_application where ap_state='通过' "+struserdepart+" "+strusernum+" "+strusername+" "+strweek+" group by ap_name order by c desc";
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
<table width="100%" border="0" bordercolor="#CCCCCC">
<tr>
<td valign="top">
<table width="100%" border="1" bordercolor="#CCCCCC">
<tr>
<th>帐号</th>
<th>姓名</th>
<th>院系</th>
<th>申请数量</th>
<th>查看申请详细</th>
<th>发布提醒</th>
<th></th>
</tr>
<%int j=0;
while(rs.next() && rs.getInt("c")>0 && j < pagenum){%><tr onMouseOver="javascript:this.bgColor='#efefef'" onMouseOut="javascript:this.bgColor='#ffffff'">
<td><%=rs.getString("ap_num")%></td>
<td><%=rs.getString("ap_name")%></td>
<td><%=rs.getString("ap_depart")%></td>
<td><%=rs.getInt("c") %></td>
<td><a href='sqtable1.jsp?num=<%=rs.getString("ap_num")%>&week=<%=week%>&name=<%=rs.getString("ap_name") %>'>查看详情</a>
</td>
<td><a href="?page=<%=nowpage%>&remind=<%=rs.getString(1)%>">发布提醒或任务</a></td>
<td><a href="sendmail.jsp?id=<%=rs.getString(1)%>&page=<%=nowpage%>">邮件</a></td>
</tr><%j++;}%>
</table>

<center>
<table width="400" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="center">第<%=nowpage%>页</td>
    <td align="center"><%if(nowpage>1){%>
      <a href="?page=<%=nowpage-1%>&userdepart=<%=userdepart%>&usernum=<%=usernum%>&username=<%=username%>&week=<%=week %>">上一页</a>
      <%}%></td>
    <td align="center"><%if(nowpage<allpage){%>
      <a href="?page=<%=nowpage+1%>&userdepart=<%=userdepart%>&usernum=<%=usernum%>&username=<%=username%>&week=<%=week %>">下一页</a>
      <%}%></td>
    <td align="center">共<%=allpage%>页</td>
  </tr>
</table>
</center>
<% }
  catch(SQLException e1)
{
e1.printStackTrace();
 out.print("SQL异常");
}%>
</td>
<td>
</td></tr>
</table>

</body>
