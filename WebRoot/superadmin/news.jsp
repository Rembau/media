<%@page language="java" pageEncoding="utf-8"  import="java.sql.*"%>
<jsp:useBean id="conn" class="javabean.Conn" scope="session"></jsp:useBean>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link rel="Shortcut Icon" href="../ico/1.ico">
<title>发布公告</title>
<link href="../css/main_style.css" rel="stylesheet" type="text/css">
<script charset="utf-8" src="../kindeditor/kindeditor-min.js"></script>
<script charset="utf-8" src="../kindeditor/lang/zh_CN.js"></script>
<script>
			var editor;
			KindEditor.ready(function(K) {
				editor = K.create('textarea[name="content"]', {
					uploadJson : '../kindeditor/jsp/upload_json.jsp',
                	fileManagerJson : '../kindeditor/jsp/file_manager_json.jsp',
					allowFileManager : true
				});
			});
</script>
</head>
<body>
<span class="current"><font color="#F00">当前位置:</font>发布公告</span>
<br>
<%
 String mark=null;
     mark=request.getParameter("mark");
	 if(mark!=null){
	 mark=new String(mark.getBytes("ISO-8859-1"),"GB2312");}
	 else mark="0";
	 
String mark1=null;
     mark1=request.getParameter("mark1");
	 if(mark1!=null){
	 mark1=new String(mark1.getBytes("ISO-8859-1"),"GB2312");}
	 else mark1="0";
	 
String content=null;
     content=request.getParameter("content");
	 if(content!=null){
	 content=new String(content.getBytes("ISO-8859-1"),"GB2312");
	 }
String topic=null;
     topic=request.getParameter("topic");
	 if(topic!=null){
	 topic=new String(topic.getBytes("ISO-8859-1"),"GB2312");
	 }
	 
String id=null;
     id=request.getParameter("id");
	 if(id!=null){
	 id=new String(id.getBytes("ISO-8859-1"),"GB2312");}
	 else {id="0";}
%>
<center>
<span class="bg">

  请选择发布对象:
<a href="?mark1=0">对教师和管理员公告</a>&nbsp;<a href="?mark1=4">只对管理员公告</a><br>
<p></p>
<%
if(!mark1.equals("4")){out.print("当前对象:所有人");}
else if(!mark1.equals("0")){out.print("当前对象:管理员");}
%>
<form method="post" action="?mark1=<%=mark1%>&id=1" name="news">
标题：<input type="text" name=topic><br>
<textarea name="content" rows="15" cols="90"></textarea><br>
<input type="submit" value="确定"></form>
<a href="../news/news.jsp">查看对所有人发布的公告</a>&nbsp;<a href="../news/adminnews.jsp">查看对管理员发布的公告</a>
<%String sql=null;
	  ResultSet rs;
	  if(id.equals("1")){
	  try{
	  if(mark1.equals("0"))
	  sql="insert into media_news(ne_topic,ne_content) values('"+topic+"','"+content+"')";
	  if(mark1.equals("4"))
	  sql="insert into media_adminnews(ad_topic,ad_content) values('"+topic+"','"+content+"')";
	  conn.stmt.executeUpdate(sql);
	  out.print("<script>alert('提交成功');</script>");}
	  catch(SQLException e1)
{
 out.print("SQL异常");
}
}%>

</span>
</center>

</body>
</html>