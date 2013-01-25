<%@page contentType="text/html; charset=GB2312" language="java" import="java.sql.*"%>
<jsp:useBean id="conn" class="javabean.Conn" scope="session"></jsp:useBean>
<html>
<head>
<title>故障申报</title>
<link href="../css/main_style.css" rel="stylesheet" type="text/css">
</head>
<script type="text/javascript">
  function check(){
     if(window.confirm('确定删除?')){
        return true;
     }
     return false;
  }
  </script>
<body>
<span class="current"><font color="#F00">当前位置:</font>查看提醒表</span>
<br>
<%
Object num=session.getAttribute("num");
Object name=session.getAttribute("name");
Object depart=session.getAttribute("depart");
Object intweek=session.getAttribute("intweek");
Object intweekday=session.getAttribute("intweekday");
Object intmonth=session.getAttribute("intmonth");
Object intday=session.getAttribute("intday");
%>
<%String sql;
ResultSet rs;
String id=null;
     id=request.getParameter("id");
	 if(id!=null){
	 id=new String(id.getBytes("ISO-8859-1"),"GB2312");}
	 else {id="0";}
	 if(!id.equals("0")){
	 sql="delete from media_remind where re_id='"+id+"'";
	 conn.stmt.executeUpdate(sql);
	 out.print("<script>alert('已删除');</script>");
	 }
	 
	  String username=null;
     username=request.getParameter("username");
	 if(username!=null && username.length()!=0){
	 username=new String(username.getBytes("ISO-8859-1"),"GB2312");
	 }
	 else {username="0";}
	 
 String usernum=null;
     usernum=request.getParameter("usernum");
	 if(usernum!=null && usernum.length()!=0){
	 usernum=new String(usernum.getBytes("ISO-8859-1"),"GB2312");
	 }
	 else {usernum="0";}

	 %>
<form method="post" action="?">
<span class="bg">
查找用户<br>
姓名<input type="text" name="username">(如:张)&nbsp;&nbsp;工号<input type="text" name="usernum">&nbsp;&nbsp;<input type="submit" value="确定">
</span>
</form>
<%
String strusernum="";
String strusername="";
if(!username.equals("0"))
strusername="and re_name like '"+username+"%'";
if(!usernum.equals("0"))
strusernum="and re_num like '"+usernum+"%'";
sql="select * from media_remind where 1=1  "+strusernum+" "+strusername;
//out.print(sql);
rs=conn.stmt.executeQuery(sql);
%>
 <table width="100%" border="1" bordercolor="#CCCCCC">
	  <tr>
	  <th>序号</th>
	  <th>提醒对象帐号</th>
	  <th>提醒对象姓名</th>
	  <th>提醒内容</th>
	  <th>提醒状态</th>
	  <th>提醒人</th>
	  <th>提醒时间</th>
	  <th></th>
	  </tr>
	  <%int xuhao=1;
	  int pagenum = 9;
			int nowpage=1;
			String currentpagestr = null;
			int allpage=1;
			int all;
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
	<%int j=0;
	while(rs.next()&&j < pagenum){%>
	<tr onMouseOver="javascript:this.bgColor='#efefef'" onMouseOut="javascript:this.bgColor='#ffffff'">
	 <td><%=k%></td>
	 <td><%=rs.getString(2)%></td>
	 <td><%=rs.getString(3)%></td>
	 <td class="td_left"><%=rs.getString(4)%></td>
	 <td><%=rs.getString(6)%></td>
	 <td><%=rs.getString(7)%></td>
	 <td><%=rs.getString(5)%></td>
	 <td><a href="?&page=<%=nowpage%>&id=<%=rs.getString(1)%>" onclick="return check()">删除</a></td> 
	 </tr>
	 
	<%k++;
	j++;
	}%>
</table>
<center>
<table width="400" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="100" align="center">第<%=nowpage%>页 </td>
    <td width="100" align="center"><%if(nowpage>1){%>
      <a href="?page=<%=nowpage-1%>">上一页</a>
      <%}%></td>
    <td width="100" align="center"><%if(nowpage<allpage){%>
      <a href="?page=<%=nowpage+1%>">下一页</a>
      <%}%></td>
    <td width="100" align="center">共<%=allpage%>页</td>
  </tr>
</table>
</center>
<%//out.print(usernum+" "+username);%>
<div align="right"><a href="daochuremind.jsp?username=<%=username%>&usernum=<%=usernum%>">导出记录</a></div>

</body>
</html>