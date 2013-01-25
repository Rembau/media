<%@page contentType="text/html; charset=GBK" language="java" import="java.sql.*"%>
<jsp:useBean id="conn" class="javabean.Conn" scope="session"></jsp:useBean>
<html>
<head>
<link rel="Shortcut Icon" href="../ico/1.ico">
<title>修改</title>
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
<%
	 String table = request.getParameter("table") != null ? request.getParameter("table") : ""; 
  	 String id = request.getParameter("id") != null ? request.getParameter("id") : "";
	 
	 String content=null;
     content=request.getParameter("content");
	 if(content!=null){
	 content=new String(content.getBytes("ISO-8859-1"),"GB2312");}
	 else {content="0";}
	 
	 String topic=null;
     topic=request.getParameter("topic");
	 if(topic!=null){
	 topic=new String(topic.getBytes("ISO-8859-1"),"GB2312");}
	 else {topic="0";}
String sql=null;
ResultSet rs=null;

if(!content.equals("0"))
{
if(table.trim().equals("media_adminnews")){
sql="update media_adminnews set ad_content='"+content+"',ad_topic='"+topic+"' where ad_id='"+id+"'";
conn.stmt.executeUpdate(sql);
out.print("<script>alert('修改成功');</script>");
}
else {
sql="update media_news set ne_content='"+content+"',ne_topic='"+topic+"' where ne_id='"+id+"'";
conn.stmt.executeUpdate(sql);
out.print("<script>alert('修改成功');</script>");
}
}
if(table.trim().equals("media_adminnews")){
sql="select * from media_adminnews where ad_id='"+id+"'";
rs=conn.stmt.executeQuery(sql);
rs.next();
content=rs.getString("ad_content");
topic=rs.getString("ad_topic");
}
else {
sql="select * from media_news where ne_id='"+id+"'";
rs=conn.stmt.executeQuery(sql);
rs.next();
content=rs.getString("ne_content");
topic=rs.getString("ne_topic");
}

%>
<form action="?id=<%=id%>" method="post">
标题：<input type="text" name="topic" value=<%=topic %>><br>
内容:<br>
<textarea cols="100" rows="25" name="content">
<%=content%></textarea><br>
<input type="submit" value="确定">&nbsp;&nbsp;&nbsp;
<a href="deleteNews.jsp?table=<%=table %>&id=<%=id %>">删除此公告</a>
</form>
<script type="text/javascript">
function delete(){
	
}
</script>
</body>
</html>