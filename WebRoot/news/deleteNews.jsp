<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<jsp:useBean id="conn" class="javabean.Conn" scope="session"></jsp:useBean>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'deleteNews.jsp' starting page</title>
  </head>
  <body>
  <%
  String table = request.getParameter("table") != null ? request.getParameter("table") : ""; 
  String id = request.getParameter("id") != null ? request.getParameter("id") : "";
  String sql="";
  if(table.trim().equals("media_adminnews")){
sql="delete from media_adminnews where ad_id='"+id+"'";
conn.stmt.executeUpdate(sql);
out.print("<script>alert('删除成功');window.location.href='../superadmin/news.jsp';</script>");
}
else {
sql="delete from media_news where ne_id='"+id+"'";
conn.stmt.executeUpdate(sql);
out.print("<script>alert('删除成功');window.location.href='../superadmin/news.jsp';</script>");
}
   %>
  </body>
</html>
