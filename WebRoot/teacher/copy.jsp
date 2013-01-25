<%@ page language="java" import="java.util.*" pageEncoding="gb18030"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>  
    <title>My JSP 'copy.jsp' starting page</title>
  <link href="../css/main_style.css" rel="stylesheet" type="text/css" />
  </head>
  
  <body>
  <form action="select.jsp" type=post>
    <span class="bg">
  根据第
  <select name="beforeweek" id="startweekselectID">
  <%for(int i=1;i<25;i++){
          out.println("<option value="+i+">"+i+"</option>");
}%>
  </select>周在第
  <select name="week" id="endweekselectID">
  <%for(int i=1;i<25;i++){
       out.println("<option value="+i+">"+i+"</option>");
  }%>
  </select>周 进行同样的选课
   <input type=submit value="提交">
     </span>
  </form>
  </body>
</html>
