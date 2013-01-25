<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="gb18030"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'stats.jsp' starting page</title>
  </head>
  <jsp:useBean id="conn" class="javabean.Conn" scope="session"></jsp:useBean>
  <link href="css/side_iframe.css" rel="stylesheet" type="text/css" />
  <body>
  <%int startweek=0,endweek=0; 
     String strstartweek=null;
     strstartweek=request.getParameter("strstartweek");
	 if(strstartweek!=null){
	 strstartweek=new String(strstartweek.getBytes("ISO-8859-1"),"GB2312");}
	 else {strstartweek="0";}
	 startweek=Integer.parseInt(strstartweek);
	 
	 String strendweek=null;
     strendweek=request.getParameter("strendweek");
	 if(strendweek!=null){
	 strendweek=new String(strendweek.getBytes("ISO-8859-1"),"GB2312");}
	 else {strendweek="0";}
	 endweek=Integer.parseInt(strendweek);
	 //out.print(strendweek);
  %>
  <form action=".StatsPicture_servlet" type=post>
  开始周次
  <select name="startweek" id="startweekselectID">
  <%for(int i=0;i<25;i++){
      if(i==startweek){
          out.println("<option value="+i+" selected>"+i+"</option>");
      }
      else out.println("<option value="+i+">"+i+"</option>");
  }%>
  </select>
  结束周次
  <select name="endweek" id="endweekselectID">
  <%for(int i=startweek;i<25;i++){
      if(i==startweek){
          out.println("<option value="+i+" selected>"+i+"</option>");
      }
      else out.println("<option value="+i+">"+i+"</option>");
  }%>
  </select>
  <input type=submit value="提交">
  <input type="button" value="刷新" onClick="location.reload(true)"> 
  </form>
   <table><tr><td><img src="media.png"></td>
   <td>
   <%
   class Stats{
   String sql="select ap_depart,sum(ap_alljie) from media_application where ap_state='通过' group by ap_depart";
   void setSql(int startweek,int endweek){
		if(endweek==0){
			return;
		}
		String ss="";
		ss=" and ap_week >= "+startweek+" and ap_week<="+endweek+" ";
		sql="select ap_depart,sum(ap_alljie) from media_application where ap_state='通过' "+ss+" group by ap_depart";
		System.out.println(sql);
	}
   }
   Stats s=new Stats();
   s.setSql(startweek,endweek);
   ResultSet rs=conn.getOldStmt().executeQuery(s.sql);
   int sum=0;
    %>
   <table border="1" style="empty-cells:show; border-collapse:collapse;">
   <th>院系</th>
   <th>总课时</th>
   <%while(rs.next()) {%>
   <tr>
   <td><%=rs.getString(1) %></td><td><%=rs.getInt(2) %></td>
   </tr>
   <%
   sum=sum+rs.getInt(2);
   } %>
   <tr>
   <td>总计</td><td><%=sum %></td>
   </tr>
   </table></td>
   </tr>
   </table>
  </body>
</html>
